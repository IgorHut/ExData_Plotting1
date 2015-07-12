# Please load the data first, i.e. execute the first part of the code and then proceed to the rest (making plots)
# If you interpret (run) the whole script at once, you might get error message since it needs some time to load the (large) data set.

# Loading data and forming the needed subset

dataRaw<- "./Data/household_power_consumption.txt"
dataFull<- read.table(dataRaw, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data<- dataFull[dataFull$Date %in% c("1/2/2007","2/2/2007") ,]
rm(dataFull)

# Plot 2 - Global Active Power - daily variations

# Setting needed varables

dateTime<-paste(data$Date, data$Time, sep=" ") 

date_time <- strptime(dateTime,"%d/%m/%Y %H:%M:%S") #date and time conversion

globalA_P <- as.numeric(data$Global_active_power) #turning factor to numeric

# Plotting 

png("plot2.png", width=480, height=480)
plot(date_time, globalA_P, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

