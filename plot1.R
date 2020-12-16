
# Load the package dplyr
library(dplyr)

# Read Data 
DataSet = read.table('household_power_consumption.txt', sep=";",header=TRUE,na.strings="?")

# Subset the data for the dates of interest 
DataF <- filter(DataSet, DataSet$Date == "1/2/2007" | DataSet$Date == "2/2/2007")

# Plot the histogram
hist(DataF$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# Save the plot as .png
dev.copy(png,file="plot1.png")
dev.off()
