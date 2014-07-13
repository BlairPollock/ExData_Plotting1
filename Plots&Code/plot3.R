#LOADING THE DATA

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/hpc.zip")
dateDownloaded <- date()
#check
list.files("./data")

#Unzip the data, rename the file "hpc.txt" and store it in a 
#folder named "data" in your working directory

#READING THE DATA
#use only data from the dates 2007-02-01 and 2007-02-02
#Change the "?" signs to "N/A" to represent missing values
plotdata <- read.table("./data/hpc.txt", sep = ";", na.strings = "?", 
                       nrows = 2880, skip = 66637, col.names = colnames(read.table
                      ("./data/hpc.txt", nrow = 1, sep = ";", header=TRUE)), 
                       comment.char = "")

#Combine the Date and Time variables to a single "datetime" variable of Date/Time class
plotdata$datetime <- paste(plotdata$Date, plotdata$Time)
plotdata$datetime <- strptime (plotdata$datetime,format="%d/%m/%Y %H:%M:%S")

#Write the plot to a png file
#Open the device driver now so that margins can be adjusted later
png (file = "plot3.png")

#Get the range for the y axis
xrange <- range(plotdata$datetime)
yrange <- range(plotdata$Sub_metering_1, plotdata$Sub_metering_2, 
                plotdata$Sub_metering_3)

#Draw the blank plot
plot(xrange, yrange, xlab = "", ylab = "Energy sub metering", type = "n" )

#Add the lines
lines(plotdata$datetime, plotdata$Sub_metering_1,col="black" )
lines(plotdata$datetime, plotdata$Sub_metering_2,col="red" )
lines(plotdata$datetime, plotdata$Sub_metering_3,col="blue" )

#Add a legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 1.5)

#Adjust the margins so that the whole legend fits on the png file
#By default, the graph will be 480x480 pixels
par(mar=c(5,3,2,2)+0.1)

#Close the png device
dev.off() 