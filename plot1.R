# This script creates a histogram of the Global_active_power variable frequency
# out of the household_power_consumption.txt dataset, and stores it to a png file.

# Read household power consumption data, subset to our two dates of interest 
# and convert Global_active_power to numeric: 
setwd("~/Downloads/")
data <- read.csv("household_power_consumption.txt", sep = ";")
consumption <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))

# Create histogram of Global Active Power Frequency
setwd("~/Desktop/Coursera/Exploratory Analysis/ExData_Plotting1/")
png("plot1.png")
hist(consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)")
dev.off() 
