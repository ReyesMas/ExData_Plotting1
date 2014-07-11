##
##  Exploratory Data Analysis
##  Course Project 1
##
##  This script constructs plot2 and saves it to a PNG file
##
##  Reading data from the working directory
##  just from 2007-02-01 and 2007-02-02
## 
    library(sqldf)
    data <- read.csv.sql(file="household_power_consumption.txt",sql="SELECT * FROM file WHERE Date in ('1/2/2007','01/02/2007','2/2/2007','02/02/2007')", sep=";")
##    
##  Plot 2: Plot of the Global Active Power for every day
##
##  Open the graphics device PNG
##
    png(filename = "plot2.png", width = 480, height = 480, units = "px")
    
##  Making the plot  
    
    ##  The x-axis variable 
    datetime <- paste(data$Date, data$Time)
    x <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
    
    ##  The y-axis variable
    y <- data$Global_active_power
    
    ##  Set the locale LC_TIME to North-American usage so the names of the week days are in english
    lct <- Sys.getlocale("LC_TIME")
    Sys.setlocale("LC_TIME", "C")

    ## plot 2
    plot(x, y, type="l", xlab="",ylab="Global Active Power (kilowatts)")
    
    ## recovery the locale LC_TIME
    Sys.setlocale("LC_TIME", lct)
    
##  Close the graphics device
##
    dev.off()
    
    