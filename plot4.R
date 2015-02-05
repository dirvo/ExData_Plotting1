source("loadData.R")

plot4 <- function(data = NULL) {
  
  if(is.null(data))
    data <- loadData()
  
  # Create a transparent PNG with 480 x 480 px
  png(filename = "figure/plot4.png", 
      width = 480, 
      height = 480,
      bg = "transparent")
  
  # Set the local to en_US to get weekdays in English
  # (Note that the locale to specify might be platform dependent, see http://stackoverflow.com/a/17031207/40347)
  Sys.setlocale("LC_TIME", "en_US")
  
  # Setup multiple charts
  par(mfrow = c(2, 2))
  
  with (data, {
    # Plot chart 1
    plot(data$Datetime, 
         data$Global_active_power, 
         type = "l",
         ylab = "Global Active Power",
         xlab = "")
    
    # Plot chart 2
    plot(data$Datetime, 
         data$Voltage, 
         type = "l",
         ylab = "Voltage",
         xlab = "datetime")
    
    # Plot chart 3
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
    
    # Plot chart 4
    plot(data$Datetime, 
         data$Global_reactive_power, 
         type = "l",
         ylab = "Global_reactive_power",
         xlab = "datetime")
  
  })
  
  dev.off()
}