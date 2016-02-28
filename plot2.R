# This script creates a plot of the Global_active_power variable against Date/Time
# out of the household_power_consumption.txt dataset, and stores it to a png file.

# Read household power consumption data, subset to our two dates of interest 
# and convert Global_active_power to numeric: 
setwd("~/Downloads/")
data <- read.csv("household_power_consumption.txt", sep = ";")
consumption <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))

# Create new variable Date_Time of format "date": 
consumption$Date <- as.character(consumption$Date)
consumption$Time <- as.character(consumption$Time)
consumption$Date_Time <- paste(consumption$Date, consumption$Time, sep = " ")
consumption$Date_Time <- strptime(consumption$Date_Time, format ="%d/%m/%Y %H:%M:%S" )


# Create plot of Global Active Power against Date_Time: 
setwd("~/Desktop/Coursera/Exploratory Analysis/ExData_Plotting1/")
png("plot2.png")
with(consumption, plot(Date_Time,Global_active_power, type = "l", xlab = "",
                       ylab = "Global active power (kilowatts)"))
dev.off() 