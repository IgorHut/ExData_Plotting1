# Please load the data first, i.e. execute the first part of the code and then proceed to the rest (making plots)
# If you interpret (run) the whole script at once, you might get error message since it needs some time to load the (large) data set.

# Loading data and forming the needed subset

dataRaw<- "./Data/household_power_consumption.txt"
dataFull<- read.table(dataRaw, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data<- dataFull[dataFull$Date %in% c("1/2/2007","2/2/2007") ,]
rm(dataFull)

# Plot 4 - Multi plot

# Setting needed varables

globalA_P <- as.numeric(data$Global_active_power) #turning factor to numeric

dateTime<-paste(data$Date, data$Time, sep=" ") 

date_time <- strptime(dateTime,"%d/%m/%Y %H:%M:%S") #date and time conversion

Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)

voltage <- as.numeric(data$Voltage)

globalR_P <- as.numeric(data$Global_reactive_power)

# Plotting
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow = c(2, 2))

plot(date_time, globalA_P, type="l", xlab="", ylab="Global_Active_Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(date_time, Sub_metering_2, type="l", col="red")
lines(date_time, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lwd=1, col=c("black", "red", "blue"))

plot(date_time, globalR_P, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
