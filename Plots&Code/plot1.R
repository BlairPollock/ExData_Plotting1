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

#Draw the base plot
hist(plotdata$Global_active_power, col = "red", main ="Global Active Power", 
     xlab="Global Active Power(kilowatts)") 

#Copy the plot to a png file
#By default, the graph will be 480x480 pixels
dev.copy(png, file = "plot1.png")

##Close the png device
dev.off() 

