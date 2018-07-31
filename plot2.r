## Get the full dataset (still trying to figure out how to read specific parts of file)
power <- read.csv("./ExploreData/household_power_consumption.txt", header=T, sep=';', na.strings="?")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subset the data by date
pcons <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert the dates
datet<- paste(as.Date(pcons$Date), pcons$Time)
pcons$Datet <- as.POSIXct(datet)

## Plot 2 (line graph)
plot(pcons$Global_active_power~pcons$Datet, type="l", xlab= "", ylab="Global Active Power (kilowatts)")

## Save to file device
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()