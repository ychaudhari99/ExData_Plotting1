library(lattice)
library(ggplot2)
library(dplyr)

#Read the data 
powerData <- tbl_df(read.table("./ExData_Plotting1/household_power_consumption.txt", 
                               header = TRUE, sep = ";",  stringsAsFactors=FALSE, dec="."))
## Convert the dates and numbers
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
powerData$Global_active_power <- as.numeric(powerData$Global_active_power)

## Subset the dataset
plotData <- subset(powerData, powerData$Date >= as.Date("2007-02-01", "%Y-%m-%d") 
                   & powerData$Date <= as.Date("2007-02-02", "%Y-%m-%d"))

## plot
png(filename = "./ExData_Plotting1/plot1.png")
hist(plotData$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()