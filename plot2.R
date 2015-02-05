source("loadData.R")

plot2 <- function(data = NULL) {
  
  if(is.null(data))
    data <- loadData()
  
  # Create a transparent PNG with 480 x 480 px
  png(filename = "figure/plot2.png", 
      width = 480, 
      height = 480,
      bg = "transparent")
  
  # Set the local to en_US to get weekdays in English
  # (Note that the locale to specify might be platform dependent, see http://stackoverflow.com/a/17031207/40347)
  Sys.setlocale("LC_TIME", "en_US")
  
  # Plot the chart
  plot(data$Datetime, 
       data$Global_active_power, 
       type = "l",
       ylab = "Global Active Power (kilowatts)",
       xlab = "")
  
  dev.off()
}
