# handle household power consumption data and plot 3

# extract subset
powerdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
powerdataDate <- as.Date(powerdata$Date,"%d/%m/%Y")
subpowerdata <- powerdata[powerdataDate>="2007-02-01" & powerdataDate<="2007-02-02",]

# plot
globalAcPower <- as.numeric(subpowerdata$Global_active_power)
dateandtime <- strptime(paste(subpowerdata$Date, subpowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subpowerdata$Sub_metering_1)
subMetering2 <- as.numeric(subpowerdata$Sub_metering_2)
subMetering3 <- subpowerdata$Sub_metering_3
png("plot3.png", width=480, height=480)
plot(dateandtime, subMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(dateandtime, subMetering2, type="l", col="red")
lines(dateandtime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=3, col=c("black", "red", "blue"))
dev.off()
