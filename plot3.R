# This script creates a plot of the the 3 energy sub-metering variables against 
# Date/Time out of the household_power_consumption.txt dataset, 
# and stores it to a png file.

# Read household power consumption data, subset to our two dates of interest 
# and convert sub metering variables to numeric: 
setwd("~/Downloads/")
data <- read.csv("household_power_consumption.txt", sep = ";")
consumption <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
consumption$Sub_metering_1 <- as.numeric(as.character(consumption$Sub_metering_1))
consumption$Sub_metering_2 <- as.numeric(as.character(consumption$Sub_metering_2))
consumption$Sub_metering_3 <- as.numeric(as.character(consumption$Sub_metering_3))

# Create new variable Date_Time of format "date": 
consumption$Date <- as.character(consumption$Date)
consumption$Time <- as.character(consumption$Time)
consumption$Date_Time <- paste(consumption$Date, consumption$Time, sep = " ")
consumption$Date_Time <- as.Date(strptime(consumption$Date_Time, format ="%d/%m/%Y %H:%M:%S" ))


# Create plots of Energy sub meterings against Date_Time: 
setwd("~/Desktop/Coursera/Exploratory Analysis/ExData_Plotting1/")
png("plot3.png")
with(consumption, { 
  plot(Date_Time,Sub_metering_1, type = "l", xlab = "",
        ylab = "Energy sub metering")
  lines(Date_Time, Sub_metering_2, col= "red" )
  lines(Date_Time, Sub_metering_3, col= "blue" )
  legend("topright", lty = 1, col = c("black","blue", "red"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off() 