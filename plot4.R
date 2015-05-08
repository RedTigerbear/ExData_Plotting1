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

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
   plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
   plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="")
   plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
   lines(Sub_metering_2~Datetime,col='Red')
   lines(Sub_metering_3~Datetime,col='Blue')
   legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power",xlab="")
})

## Save to PNG
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
