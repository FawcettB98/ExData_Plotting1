# Read in Power Consumption Data
power_data<-read.table("household_power_consumption.txt",sep=";",header=FALSE,skip=66637,nrows=2880)
power_data_headers<-read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=2)
names(power_data)<-names(power_data_headers)

#Create a column with combined  dates and times
power_data$DateTime<-strptime(paste(power_data$Date, power_data$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1),cex=0.7)

#Create Plot #2 - Line Graph of Global Active Power
plot(power_data$DateTime,power_data$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Copy plot to a png file
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
