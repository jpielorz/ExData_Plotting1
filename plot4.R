## Course work for Exploratory Data Analysis
## Plotting Assignment 1
## R script for reproducing Plot 4

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

## Plot graphs to png device

png(file="../repos//ExData_Plotting1/plot4.png", width=480, height=480)

par(mfrow=c(2,2))

with (febData, {
      
      ## Plot 1
      with (febData, plot(DateTime,Global_active_power, type="l", xlab="", ylab="Global Active Power"))
      ## Plot 2
      with (febData, plot(DateTime,Voltage, type="l", xlab="datetime"))
      ## Plot 3
      with (febData, plot(DateTime,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
      lines(febData$DateTime,febData$Sub_metering_2,col="red")
      lines(febData$DateTime,febData$Sub_metering_3,col="blue")
      legend("topright",bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      ## Plot 4
      with (febData, plot(DateTime,Global_reactive_power, type="l", xlab="datetime"))
      
})

## Switch to sreen device

dev.off()