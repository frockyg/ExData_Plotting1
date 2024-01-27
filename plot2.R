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
png(file="./plot2.png",width=480,height=480)
#R tick data: merging date and time into a single object which will be plotted on x-axis
mergedatetime<-as.POSIXct(paste(targetdata$Date,targetdata$Time),format="%Y-%m-%d %H:%M:%S")
plot(mergedatetime,global.active.power.data,type="l",xlab="",ylab="Global Active Power (kilowatts)", xaxt="n")
myTicks<-axTicks(1)
xlabels<-weekdays(as.POSIXct(myTicks),abbreviate=TRUE)
xlabels[2]=xlabels[4]=""
axis(1, at = as.POSIXct(myTicks), labels = xlabels)
#switch off png device
dev.off()
