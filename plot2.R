# Script to read in data and generate plot2 for the course project.
DataLoc <- "./household_power_consumption.txt"
PwrData <- read.table(DataLoc, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
TwoDayLook <- PwrData[PwrData$Date %in% c("1/2/2007", "2/2/2007"),]
DTConv <- strptime(paste(TwoDayLook$Date, TwoDayLook$Time, sep=" "), "%d/%m/%Y%H:%M:%S")
GAP <- as.numeric(TwoDayLook$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(DTConv, GAP, type="l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()