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

# Generate plot
plot(DataF$DateTime, DataF$Sub_metering_1, type = "l", col="black", ylab="Energy sub metering", xlab = "")
lines(DataF$DateTime, DataF$Sub_metering_2, type="l", col="red")
lines(DataF$DateTime, DataF$Sub_metering_3, type="l", col="blue")

# Add legend 
legend("topright", legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), col=c("black","red","blue"),  lwd=c(1,1,1))

# Save the plot as .png
dev.copy(png,file="plot3.png")
dev.off()