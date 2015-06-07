dFile <- "./data/household_power_consumption.txt"
data <- read.table(dFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
workData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#creating sub metering variables
datetime <- strptime(paste(workData$Date, workData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(workData$Global_active_power)
globalReactivePower <- as.numeric(workData$Global_reactive_power)
voltage <- as.numeric(workData$Voltage)
sub_Metering_1 <- as.numeric(workData$Sub_metering_1)
sub_Metering_2 <- as.numeric(workData$Sub_metering_2)
sub_Metering_3 <- as.numeric(workData$Sub_metering_3)

#Creating plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_Metering_2, type="l", col="red")
lines(datetime, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
