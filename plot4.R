src <- "household_power_consumption.txt"
alldata <- read.table(src, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## subsetting data
data <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"), ]

## plotting
actpow <- as.numeric(data$Global_active_power)
time <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
reactpow <- as.numeric(data$Global_reactive_power)
volt <- as.numeric(data$Voltage)

subM1 <- as.numeric(data$Sub_metering_1)
subM2 <- as.numeric(data$Sub_metering_2)
subM3 <- as.numeric(data$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(time, actpow, type = "l", ylab = "Global Active Power", xlab = "", cex = 0.2)
plot(time, volt, type = "l", xlab = "datetime", ylab = "Voltage")
plot(time, subM1, type = "l", ylab = "Energy submeter", xlab = "")
lines(time, subM2, type = "l", col = "red")
lines(time, subM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2.5, col = c("black", "red", "blue"), bty = "o")

plot(time, reactpow, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

