# Please load the data first, i.e. execute the first part of the code and then proceed to the rest (making plots)
# If you interpret (run) the whole script at once, you might get error message since it needs some time to load the (large) data set.

# Loading data and forming the needed subset

dataRaw<- "./Data/household_power_consumption.txt"
dataFull<- read.table(dataRaw, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data<- dataFull[dataFull$Date %in% c("1/2/2007","2/2/2007") ,]
rm(dataFull)

# Plot 3 - Sub-metering

# Setting needed varables

dateTime<-paste(data$Date, data$Time, sep=" ") 

date_time <- strptime(dateTime,"%d/%m/%Y %H:%M:%S") #date and time conversion

Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Plotting

png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

plot(date_time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(date_time, Sub_metering_2, col = "red")
lines(date_time, Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

dev.off()