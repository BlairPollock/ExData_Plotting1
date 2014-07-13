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

#Combine the Date and Time variables to a single datetime variable of Date/Time class
plotdata$datetime <- paste(plotdata$Date, plotdata$Time)
plotdata$datetime <- strptime (plotdata$datetime,format="%d/%m/%Y %H:%M:%S")

#check
plotdata$datetime[1:5]
class(plotdata$datetime)

#Draw the base plot
with (plotdata, plot(datetime, Global_active_power, 
     ylab = "Global Active Power(kilowatts)", type = "l")) 

#Copy the plot to a png file
#By default, the graph will be 480x480 pixels
dev.copy(png, file = "plot2.png")

##Close the png device
dev.off() 