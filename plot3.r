## Get the full dataset (still trying to figure out how to read specific parts of file)
power <- read.csv("./ExploreData/household_power_consumption.txt", header=T, sep=';', na.strings="?")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subset the data by date
pcons <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert the dates
datet<- paste(as.Date(pcons$Date), pcons$Time)
pcons$Datet <- as.POSIXct(datet)

## Plot 3 (submetering with legend)
with(pcons,
     {plot(Sub_metering_1~Datet, type="l", xlab="", ylab="Energy sub metering")
lines(Sub_metering_2~Datet, col="Red")
lines(Sub_metering_3~Datet, col="Blue")})
legend("topright", lty=1, col=c("Black", "Red", "Blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to file device
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()