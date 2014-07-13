## Course work for Exploratory Data Analysis
## Plotting Assignment 1
## R script for reproducing Plot 1

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

## Plot histogram to png device

png(file="../repos//ExData_Plotting1/plot1.png", width=480, height=480)

hist(febData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## Switch to screen device

dev.off()