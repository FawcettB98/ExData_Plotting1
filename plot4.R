# Read in Power Consumption Data
power_data<-read.table("household_power_consumption.txt",sep=";",header=FALSE,skip=66637,nrows=2880)
power_data_headers<-read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=2)
names(power_data)<-names(power_data_headers)

#Create a column with combined  dates and times
power_data$DateTime<-strptime(paste(power_data$Date, power_data$Time), "%d/%m/%Y %H:%M:%S")

#Set up 4x4 window
par(mfrow=c(2,2),mar=c(4,5,3,1),cex=.7)

#Create Plot #1 - Line Graph of Global Active Power
plot(power_data$DateTime,power_data$Global_active_power,type="l", xlab="", ylab="Global Active Power")

#Create Plot #2 - Line Graph of Voltage
plot(power_data$DateTime,power_data$Voltage,type="l", xlab="datetime", ylab="Voltage")

#Create Plot #3 - Line Graph of Sub Metering 1,2 & 3
plot(power_data$DateTime,power_data$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(power_data$DateTime,power_data$Sub_metering_2,type="l",col="red")
lines(power_data$DateTime,power_data$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")

#Create Plot #4 - Line Graph of Global Reactive Power
plot(power_data$DateTime,power_data$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")


#Copy plot to a png file
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
