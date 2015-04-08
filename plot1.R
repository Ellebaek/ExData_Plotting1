# EDA - Course project 1
# plot 1
startDate<-as.Date("2007-02-01")
endDate<-as.Date("2007-02-02")

data<-read.csv("household_power_consumption.txt", sep=";",na.strings="?")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
gdata<-subset(data, Date >= startDate)
gdata<-subset(gdata, Date <= endDate)
png("plot1.png", width=480, height=480)
hist(gdata$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
