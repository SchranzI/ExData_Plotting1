src <- "household_power_consumption.txt"
alldata <- read.table(src, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## subsetting data
data <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"), ]

## plotting
actpow <- as.numeric(data$Global_active_power)
time <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(time, actpow, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
