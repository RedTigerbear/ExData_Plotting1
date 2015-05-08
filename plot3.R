## Set locale to English
Sys.setlocale("LC_TIME", "English")

## Get all data
FilePath <- "./data/household_power_consumption.txt"
household_power_consumption <- read.table(FilePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

## Extract 2 days from data
data <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$Datetime <- as.POSIXct(paste(data$Date, data$Time))
rm(household_power_consumption)

## Plot 3
with(data, {
   plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
   lines(Sub_metering_2~Datetime,col='Red')
   lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
