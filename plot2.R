# handle household power consumption data and plot 2

# extract subset
powerdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
powerdataDate <- as.Date(powerdata$Date,"%d/%m/%Y")
subpowerdata <- powerdata[powerdataDate>="2007-02-01" & powerdataDate<="2007-02-02",]

# plot
globalAcPower <- as.numeric(subpowerdata$Global_active_power)
dateandtime <- strptime(paste(subpowerdata$Date, subpowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(dateandtime, globalAcPower, type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
