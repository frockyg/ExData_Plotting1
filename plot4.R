setwd("~/Coursera/EDA/Week1/ExData_Plotting1")

#first read in dataset
targetdata<-read.delim("household_power_consumption.txt",sep=";")
#convert date column to type "Date"
targetdata$Date<-as.Date(targetdata$Date,"%d/%m/%Y")
#subset the data corresponding to date range ["2007-02-01","2007-02-02"]
targetdata<-subset(targetdata,targetdata$Date<="2007-02-02"&targetdata$Date>="2007-02-01")

#extract data from Global_active_power and convert to numeric data
global.active.power.data<-as.numeric(targetdata$Global_active_power)

#R tick data: merging date and time into a single object which will be plotted on x-axis
mergedatetime<-as.POSIXct(paste(targetdata$Date,targetdata$Time),format="%Y-%m-%d %H:%M:%S")

#open a graphics device png()
png(file="./plot4.png",width=480,height=480)

par(mfcol=c(2,2))


plot(mergedatetime,global.active.power.data,type="l",xlab="",ylab="Global Active Power (kilowatts)", xaxt="n")
myTicks<-axTicks(1)
xlabels<-weekdays(as.POSIXct(myTicks),abbreviate=TRUE)
xlabels[2]=xlabels[4]=""
axis(1, at = as.POSIXct(myTicks), labels = xlabels)

SM1<-as.numeric(targetdata[,7]) #submetering 1 data
SM2<-as.numeric(targetdata[,8]) #submetering 2 data
SM3<-as.numeric(targetdata[,9]) #submetering 3 data

cl<-c("black","red","blue")


plot(mergedatetime,SM1,col=cl[1],type="l",xlab="",ylab="Energy sub metering", xaxt="n")
lines(mergedatetime,SM2,col=cl[2],type="l")
lines(mergedatetime,SM3,col=cl[3],type="l")
legend("topright",names(targetdata)[7:9],lty=1,col=cl,bty="n")

axis(1, at = as.POSIXct(myTicks), labels = xlabels)

plot(mergedatetime,targetdata$Voltage,type="l",xlab="datetime",ylab="Voltage", xaxt="n")
axis(1, at = as.POSIXct(myTicks), labels = xlabels)

plot(mergedatetime,targetdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power", xaxt="n")
axis(1, at = as.POSIXct(myTicks), labels = xlabels)

#switch off png device
dev.off()