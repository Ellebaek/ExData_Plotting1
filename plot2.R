# EDA - Course project 1
# plot 2
startDate<-as.Date("2007-02-01")
endDate<-as.Date("2007-02-02")

data<-read.csv("household_power_consumption.txt", sep=";",na.strings="?")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
gdata<-subset(data, Date >= startDate)
gdata<-subset(gdata, Date <= endDate)
xvals<-strptime(paste(gdata$Date, gdata$Time), "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_ALL","English")
png("plot2.png", width=480, height=480)
plot(xvals, gdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
Sys.setlocale("LC_ALL","")
dev.off()

