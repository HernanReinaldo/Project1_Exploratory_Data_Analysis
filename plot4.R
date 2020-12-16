# Load important packages
library(dplyr)

# Read Data 
DataSet = read.table('household_power_consumption.txt', sep=";",header=TRUE,na.strings="?")

# Subset the data for the dates of interest 
DataF <- filter(DataSet, DataSet$Date == "1/2/2007" | DataSet$Date == "2/2/2007")

# Include a date time column
DataF <- mutate(DataF, DateTime = paste(Date, Time, sep = " "))

# Transfor to data time format
DataF$DateTime <- strptime(DataF$DateTime, "%d/%m/%Y %H:%M:%S")

# define the frame 
par(mfrow=c(2,2), mar=c(4,4,2,1),oma=c(0,0,2,0))

# Generate plot
# Plot in position (1,1)
plot(DataF$DateTime, DataF$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
# Plot in position (1,2)
plot(DataF$DateTime, DataF$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
# Plot in position (2,1)
plot(DataF$DateTime, DataF$Sub_metering_1, type = "n", ylab="Energy sub metering", xlab = "")
lines(DataF$DateTime, DataF$Sub_metering_1, type = "l", col="black")
lines(DataF$DateTime, DataF$Sub_metering_2, type="l", col="red")
lines(DataF$DateTime, DataF$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), col=c("black","red","blue"),  lwd=c(1,1,1))
plot(DataF$DateTime, DataF$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# Save the plot as .png
dev.copy(png,file="plot4.png")
dev.off()