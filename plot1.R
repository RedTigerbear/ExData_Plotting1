## Set locale to English
Sys.setlocale("LC_TIME", "English")

## Get all data
FilePath <- "./data/household_power_consumption.txt"
household_power_consumption <- read.table(FilePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

## Extract 2 days from data
data <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(household_power_consumption)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
