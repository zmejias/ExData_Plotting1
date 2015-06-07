#Reading
dFile <- "./data/household_power_consumption.txt"
data <- read.table(dFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
workData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Creating subMetering variables
datetime <- strptime(paste(workData$Date, workData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(workData$Global_active_power)
sub_Metering_1 <- as.numeric(workData$Sub_metering_1)
sub_Metering_2 <- as.numeric(workData$Sub_metering_2)
sub_Metering_3 <- as.numeric(workData$Sub_metering_3)

#Creating Plot 3
png("plot3.png", width=480, height=480)
plot(datetime, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_Metering_2, type="l", col="red")
lines(datetime, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
