# handle household power consumption data and plot 1

# extract subset
powerdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
powerdataDate <- as.Date(powerdata$Date,"%d/%m/%Y")
subpowerdata <- powerdata[powerdataDate>="2007-02-01" & powerdataDate<="2007-02-02",]

# plot
globalAcPower <- as.numeric(subpowerdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalAcPower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
