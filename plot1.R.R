setwd("~/data/New folder")

#load data in and subset for specific dates
tabALL <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")

ssd <- tabALL[tabALL$Date %in% c("1/2/2007","2/2/2007"),]

#plot 1
gap <- as.numeric(ssd$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()