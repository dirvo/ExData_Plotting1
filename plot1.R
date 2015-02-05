source("loadData.R")

plot1 <- function(data = NULL) {
  
  if(is.null(data))
    data <- loadData()
  
  # Create a transparent PNG with 480 x 480 px
  png(filename = "figure/plot1.png", 
      width = 480, 
      height = 480,
      bg = "transparent")
  
  # Plot a historgram in red with correct labels and title
  hist(data$Global_active_power, 
       main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)", 
       col = "red")
  
  dev.off()
}
