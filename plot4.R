# EDA - Course project 1
# plot 4
startDate<-as.Date("2007-02-01")
endDate<-as.Date("2007-02-02")

data<-read.csv("household_power_consumption.txt", sep=";",na.strings="?")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
gdata<-subset(data, Date >= startDate)
gdata<-subset(gdata, Date <= endDate)
xvals<-strptime(paste(gdata$Date, gdata$Time), "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_ALL","English")
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

# upper left corner
plot(xvals, gdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# lower left corner
plot(xvals, gdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(xvals, gdata$Sub_metering_2, type="l", col="red")
points(xvals, gdata$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")

# upper right corner
plot(xvals, gdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

# lower right corner
plot(xvals, gdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

Sys.setlocale("LC_ALL","")
dev.off()
