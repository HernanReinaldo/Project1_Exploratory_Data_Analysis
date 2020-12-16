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
plot(DataF$DateTime, DataF$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Save the plot as .png
dev.copy(png,file="plot2.png")
dev.off()
