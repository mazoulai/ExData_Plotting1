# This script creates a set of plots based on the household_power_consumption.txt 
# dataset, and stores it to a png file.

# Read household power consumption data, subset to our two dates of interest 
# and convert variables to numeric for plotting: 
setwd("~/Downloads/")
data <- read.csv("household_power_consumption.txt", as.is = TRUE, sep = ";")
consumption <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
consumption$Global_active_power <- as.numeric(consumption$Global_active_power)
consumption$Global_reactive_power <- as.numeric(consumption$Global_reactive_power)
consumption$Voltage <- as.numeric(consumption$Voltage)
consumption$Sub_metering_1 <- as.numeric(consumption$Sub_metering_1)
consumption$Sub_metering_2 <- as.numeric(consumption$Sub_metering_2)

# Create new variable Date_Time of format "date": 
consumption$Date_Time <- paste(consumption$Date, consumption$Time, sep = " ")
consumption$Date_Time <- strptime(consumption$Date_Time, format ="%d/%m/%Y %H:%M:%S" )

# Initiate device and global graphic parameters:
setwd("~/Desktop/Coursera/Exploratory Analysis/ExData_Plotting1/")
png("plot4.png")
par(mfcol = c(2, 2), mar = c(4,4,2,2))

# Create plot of Global Active Power against Date_Time: 
with(consumption, plot(Date_Time,Global_active_power, type = "l", xlab = "",
                       ylab = "Global active power (kilowatts)"))

# Create plots of Energy sub meterings against Date_Time: 
with(consumption, { 
  plot(Date_Time,Sub_metering_1, type = "l", xlab = "",
       ylab = "Energy sub metering")
  lines(Date_Time, Sub_metering_2, col= "red" )
  lines(Date_Time, Sub_metering_3, col= "blue" )
  legend("topright", lty = 1, col = c("black","blue", "red"), bty = "n", xjust = 1,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# Create plot of Voltage against Date_Time:
with(consumption, plot(Date_Time,Voltage, type = "l", xlab = "datetime"))

# Create plot of Global reactive power against Date_Time:
with(consumption, plot(Date_Time, Global_reactive_power, type = "l", xlab = "datetime" ))

# Save file and exit device:
dev.off() 