# EDA - Course project 1
# plot 3
startDate<-as.Date("2007-02-01")
endDate<-as.Date("2007-02-02")

data<-read.csv("household_power_consumption.txt", sep=";",na.strings="?")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
gdata<-subset(data, Date >= startDate)
gdata<-subset(gdata, Date <= endDate)
xvals<-strptime(paste(gdata$Date, gdata$Time), "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_ALL","English")
png("plot3.png", width=480, height=480)

plot(xvals, gdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(xvals, gdata$Sub_metering_2, type="l", col="red")
points(xvals, gdata$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

Sys.setlocale("LC_ALL","")
dev.off()
