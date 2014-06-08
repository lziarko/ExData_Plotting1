fileUrl<-("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
download.file(fileUrl,destfile="./data_all.txt")
data_all<-read.table("./data_all.txt", header=T, sep=";", na.strings="?", quote="\"")
data<-subset(data_all, data_all$Date=="1/2/2007" | data_all$Date=="2/2/2007")
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
png(file="plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
#plot 1
plot(data$DateTime,data$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power (killowats)")
#plot 2
plot(data$DateTime,data$Voltage,type="l",main="",xlab="datetime",ylab="Voltage")
#plot 3
plot(data$DateTime,data$Sub_metering_1, type="l", ylim=range(0:30),ylab="Energy sub  metering",col="black")
par(new=T)
plot(data$DateTime,data$Sub_metering_2, type="l", ylim=range(0:30),ylab="",col="red")
par(new=T)
plot(data$DateTime,data$Sub_metering_3, type="l", ylim=range(0:30),ylab="",col="blue")
#plot 4
plot(data$DateTime,data$Global_reactive_power,type="l",main="",xlab="datetime",ylab="Global_reactive_power")
dev.off()