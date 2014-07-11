##
##  Exploratory Data Analysis
##  Course Project 1
##
##
##  This script constructs plot3 and saves it to a PNG file
##
##
##  Reading data from the working directory
##  just from 2007-02-01 and 2007-02-02
## 
    library(sqldf)
    data <- read.csv.sql(file="household_power_consumption.txt",sql="SELECT * FROM file WHERE Date in ('1/2/2007','01/02/2007','2/2/2007','02/02/2007')", sep=";")
##    
##  Plot 3: Plot of the Energy sub metering 1, 2 and 3 for every day
##
##  Open the graphics device PNG
##
    png(filename = "plot3.png", width = 480, height = 480, units = "px")
    
##  Making the plot  
    
    ##  The x-axis variable 
    datetime <- paste(data$Date, data$Time)
    x <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
    
    ##  Set the locale LC_TIME to North-American usage so the names of the week days are in english
    lct <- Sys.getlocale("LC_TIME")
    Sys.setlocale("LC_TIME", "C")

    ## plot 3
    ##  Sub metering 1
    y <- data$Sub_metering_1
    plot(x, y, type="l", xlab="",ylab="Energy sub metering", col="black")
    ##  Sub metering 2
    y <- data$Sub_metering_2
    lines(x, y, type="l", col="red")
    ##  Sub metering 3
    y <- data$Sub_metering_3
    lines(x, y, type="l", col="blue")
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))
    
    ## recovery the locale LC_TIME
    Sys.setlocale("LC_TIME", lct)
    
##  Close the graphics device
##
    dev.off()
    
    