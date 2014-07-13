## Course work for Exploratory Data Analysis
## Plotting Assignment 1
## R script for reproducing Plot 3

library(datasets)

## Loading first five rows from data file to determine classes

powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=5)
classes <- sapply(powerData,class)

## Load complete data with colClasses to improve performance

powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=classes)

## Extract rows with proper dates from complete dataset

febData <- powerData[which(powerData$Date=="1/2/2007" | powerData$Date=="2/2/2007"), ]

## Paste Date/Time column and insert result into new DateTime column. Convert new column to R Date/Time class.

febData$DateTime <- paste(febData$Date, febData$Time)
febData$DateTime <- strptime(febData$DateTime, format="%d/%m/%Y %H:%M:%S")

## Plot graph to png device

png(file="../repos//ExData_Plotting1/plot3.png", width=480, height=480)

with (febData, plot(DateTime,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(febData$DateTime,febData$Sub_metering_2,col="red")
lines(febData$DateTime,febData$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Switch to sreen device

dev.off()