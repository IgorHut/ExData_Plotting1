# Please load the data first, i.e. execute the first part of the code and then proceed to the rest (making plots)
# If you interpret (run) the whole script at once, you might get error message since it needs some time to load the (large) data set.

# Loading data and forming the needed subset

dataRaw<- "./Data/household_power_consumption.txt"
dataFull<- read.table(dataRaw, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data<- dataFull[dataFull$Date %in% c("1/2/2007","2/2/2007") ,]
rm(dataFull)


# Plot 1 - Global Active Power

globalA_P <- as.numeric(data$Global_active_power) #turning factor to numeric

png("plot1.png", width=480, height=480)

hist(globalA_P, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()