src <- "household_power_consumption.txt"
alldata <- read.table(src, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## subsetting data
data <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"), ]

## plotting
actpow <- as.numeric(data$Global_active_power)
time <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
subM1 <- as.numeric(data$Sub_metering_1)
subM2 <- as.numeric(data$Sub_metering_2)
subM3 <- as.numeric(data$Sub_metering_3)

png("plot3.png")
plot(time, subM1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(time, subM2, type = "l", col = "red")
lines(time, subM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()