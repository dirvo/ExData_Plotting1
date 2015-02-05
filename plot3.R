source("loadData.R")

plot3 <- function(data = NULL) {
  
  if(is.null(data))
    data <- loadData()
  
  # Create a transparent PNG with 480 x 480 px
  png(filename = "figure/plot3.png", 
      width = 480, 
      height = 480,
      bg = "transparent")
  
  # Set the local to en_US to get weekdays in English
  # (Note that the locale to specify might be platform dependent, see http://stackoverflow.com/a/17031207/40347)
  Sys.setlocale("LC_TIME", "en_US")
  
  # Plot the chart
  plot(data$Datetime, 
       data$Sub_metering_1, 
       type = "l",
       ylab = "Energy sub metering",
       xlab = "")
  
  # Add additional data series
  points(data$Datetime, data$Sub_metering_2, type = "l", col = "red")
  points(data$Datetime, data$Sub_metering_3, type = "l", col = "blue")
  
  # Add top-right legend with line type solid
  legend("topright", 
         lty = 1, 
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
}