# Script to read in data and generate plot3 for the course project.
DataLoc <- "./household_power_consumption.txt"
PwrData <- read.table(DataLoc, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
TwoDayLook <- PwrData[PwrData$Date %in% c("1/2/2007", "2/2/2007"),]
DTConv <- strptime(paste(TwoDayLook$Date, TwoDayLook$Time, sep=" "), "%d/%m/%Y%H:%M:%S")
GAP <- as.numeric(TwoDayLook$Global_active_power)
SubM1 <- as.numeric(TwoDayLook$Sub_metering_1)
SubM2 <- as.numeric(TwoDayLook$Sub_metering_2)
SubM3 <- as.numeric(TwoDayLook$Sub_metering_3)
png("plot3.png", width = 480, height = 480)
plot(DTConv, SubM1, type="l", xlab = "", ylab = "Energy Submetering")
lines(DTConv, SubM2, type = "l", col = "red")
lines(DTConv, SubM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()