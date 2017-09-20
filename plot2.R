library(lattice)
library(ggplot2)
library(dplyr)

## Read data
powerData <- tbl_df(read.table("./ExData_Plotting1/household_power_consumption.txt", 
                               header = TRUE, sep = ";",  stringsAsFactors=FALSE, dec="."))

## COnvert data type
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
powerData$Global_active_power <- as.numeric(powerData$Global_active_power)

## Get subset
plotData <- subset(powerData, powerData$Date >= as.Date("2007-02-01", "%Y-%m-%d") 
                   & powerData$Date <= as.Date("2007-02-02", "%Y-%m-%d"))

datetime <- strptime(paste(as.character(plotData$Date), plotData$Time, sep = " "), 
                     format = "%Y-%m-%d %H:%M:%S")

## plot
png(filename = "./ExData_Plotting1/plot2.png")
plot(datetime, plotData$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()