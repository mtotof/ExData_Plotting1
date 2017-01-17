?setwd("~/data/New folder")

#load data in and subset for specific dates
tabALL <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")

ssd <- tabALL[tabALL$Date %in% c("1/2/2007","2/2/2007"),]

#plot 1
gap <- as.numeric(ssd$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

#plot 2
gap <- as.numeric(ssd$Global_active_power)
dt <- strptime(paste(ssd$Date, ssd$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width = 480, height = 480)
plot(dt, gap, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()

#plot 3
gap <- as.numeric(ssd$Global_active_power)
dt <- strptime(paste(ssd$Date, ssd$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
s1 <- as.numeric(ssd$Sub_metering_1)
s2 <- as.numeric(ssd$Sub_metering_2)
s3 <- as.numeric(ssd$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(dt, s1, type="l", ylab = "Energy sub metering", xlab = "")
lines(dt, s2, type="l", col="red")
lines(dt, s3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =1, lwd = 2.5, col= c("black", "red", "blue"))
dev.off()

#plot 4
gap <- as.numeric(ssd$Global_active_power)
dt <- strptime(paste(ssd$Date, ssd$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
s1 <- as.numeric(ssd$Sub_metering_1)
s2 <- as.numeric(ssd$Sub_metering_2)
s3 <- as.numeric(ssd$Sub_metering_3)
grp <- as.numeric(ssd$Global_reactive_power)
v <- as.numeric(ssd$Voltage)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(dt, gap, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
plot(dt, v, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dt, s1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dt, s2, type = "l", col = "red")
lines(dt, s3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = , lwd = 2.5, col = c("black", "red", "blue"), bty = "o")
plot(dt, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()