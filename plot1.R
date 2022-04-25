src <- "household_power_consumption.txt"
alldata <- read.table(src, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## subsetting data
data <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"), ]

## plotting
actpow <- as.numeric(data$Global_active_power)
png("plot1.png")
hist(actpow, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

