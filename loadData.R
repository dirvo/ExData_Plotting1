library(dplyr)

loadData <- function() {
  filename <- "household_power_consumption.txt"
  
  # Read input (only read first 80000 rows)
  data <- read.csv(filename, 
                   na.strings = c("?"), 
                   header = TRUE, 
                   sep = ";",
                   nrows = 80000, # performance optimization to load faster
                   colClasses=c("character", "character", rep("numeric",7)))
  
  # convert Date and Time column into single Datetime column of type POSIXct
  data <- data %>%
    #filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(Datetime = as.POSIXct(strptime(paste(Date, data$Time), "%d/%m/%Y %H:%M:%S"))) %>%
    select(Datetime, Global_active_power:Sub_metering_3) %>%
    filter(Datetime >= as.POSIXct('2007-02-01') & Datetime <= as.POSIXct('2007-02-03'))
  
}