##
## Exploratory Data Analysis
## Course Project 1
##
##
## This script constructs plot1 and saves it to a PNG file
##
##
##  Reading data from the working directory
##  just from 2007-02-01 and 2007-02-02
## 
    library(sqldf)
    data <- read.csv.sql(file="household_power_consumption.txt",sql="SELECT * FROM file WHERE Date in ('1/2/2007','01/02/2007','2/2/2007','02/02/2007')", sep=";")
##    
## Plot 1: histogram of the Global Active Power variable
##
##  Open the graphics device PNG
##
    png(filename = "plot1.png", width = 480, height = 480, units = "px")

##  constructing the histogram    
##
    hist(data$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
    
##  Close the graphics device
##
    dev.off()
    
    
    