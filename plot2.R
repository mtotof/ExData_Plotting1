setwd("~/data/New folder")

#load data in and subset for specific dates
tabALL <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")

ssd <- tabALL[tabALL$Date %in% c("1/2/2007","2/2/2007"),]

#plot 2
gap <- as.numeric(ssd$Global_active_power)
dt <- strptime(paste(ssd$Date, ssd$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width = 480, height = 480)
plot(dt, gap, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()