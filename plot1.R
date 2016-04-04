# Script to read in data and generate plot1 for the course project.
DataLoc <- "./household_power_consumption.txt"
PwrData <- read.table(DataLoc, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
TwoDayLook <- PwrData[PwrData$Date %in% c("1/2/2007", "2/2/2007"),]
GAP <- as.numeric(TwoDayLook$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()