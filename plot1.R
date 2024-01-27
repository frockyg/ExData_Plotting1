setwd("~/Coursera/EDA/Week1/ExData_Plotting1")

#first read in dataset
targetdata<-read.delim("household_power_consumption.txt",sep=";")
#convert date column to type "Date"
targetdata$Date<-as.Date(targetdata$Date,"%d/%m/%Y")
#subset the data corresponding to date range ["2007-02-01","2007-02-02"]
targetdata<-subset(targetdata,targetdata$Date<="2007-02-02"&targetdata$Date>="2007-02-01")
#extract data from Global_active_power and convert to numeric data
global.active.power.data<-as.numeric(targetdata$Global_active_power)

#open a graphics device png()
png(file="./plot1.png",width=480,height=480)
#create a histogram with the appropriate title and x-axis label
hist(global.active.power.data,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
#switch off png device
dev.off()
