library(lattice)
library(ggplot2)
library(dplyr)

## Read data
powerData <- tbl_df(read.table("./ExData_Plotting1/household_power_consumption.txt", 
                               header = TRUE, sep = ";",  stringsAsFactors=FALSE, dec="."))

## COnvert data type
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
powerData$Global_active_power <- as.numeric(powerData$Global_active_power)
powerData$Sub_metering_1 <- as.numeric(powerData$Sub_metering_1)
powerData$Sub_metering_2 <- as.numeric(powerData$Sub_metering_2)
powerData$Sub_metering_3 <- as.numeric(powerData$Sub_metering_3)

## Get subset
plotData <- subset(powerData, powerData$Date >= as.Date("2007-02-01", "%Y-%m-%d") 
                   & powerData$Date <= as.Date("2007-02-02", "%Y-%m-%d"))

datetime <- strptime(paste(as.character(plotData$Date), plotData$Time, sep = " "), 
                     format = "%Y-%m-%d %H:%M:%S")

## plot
png(filename = "./ExData_Plotting1/plot3.png")
plot(datetime, plotData$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(datetime, plotData$Sub_metering_2, type = "l", col = "red")
lines(datetime, plotData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))
dev.off()