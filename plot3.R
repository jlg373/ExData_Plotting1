# Plotting Assignment 1 for Exploratory Data Analysis - 
# This script generates the third graphic in the assignment - energy sub metering as a function of time.

# If appropriate data file does not exist in working directory, download and unzip.
if(!file.exists("household_power_consumption.txt")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "PowerData.zip")
        unzip("PowerData.zip")
        file.remove("PowerData.zip")
}

# Load required subset of data and name columns appropriately.
# To save time and memory, the entire dataset is not loaded.
header <- read.table("household_power_consumption.txt", sep = ";", nrows = 1)
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
colnames(data) <- unlist(header)

# Convert time to POSIXct.
data$Time <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Create and save plot as a png file in the working directory.
png(file = "plot3.png")
with(data, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering"))
with(data, lines(Time, Sub_metering_2, type = "l", col = "red"))
with(data, lines(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()