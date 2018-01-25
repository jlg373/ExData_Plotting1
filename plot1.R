# Plotting Assignment 1 for Exploratory Data Analysis - 
# This script generates the first graphic in the assignment - a histogram of global active power.

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

# Create and save plot as a png file in the working directory.
png(file = "plot1.png")
with(data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.off()