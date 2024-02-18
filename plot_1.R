# Set the working directory
setwd("C:/Users/Hawking's/PycharmProjects/pythonProject3/household_power_consumption_ex")

# Read the data
t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# Format date to Type Date
t$Date <- as.Date(t$Date, "%d/%m/%Y")

# Filter data set from Feb. 1, 2007, to Feb. 2, 2007
t <- subset(t, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Remove incomplete observations
t <- na.omit(t)

# Combine Date and Time column
t$DateTime <- as.POSIXct(paste(t$Date, t$Time), format="%Y-%m-%d %H:%M:%S")

# Remove Date and Time columns
t <- t[, !(names(t) %in% c("Date", "Time"))]

# Print summary of the data
summary(t)

# Check unique values in 'Global_active_power'
unique(t$Global_active_power)

# Print the first few rows of the data frame
head(t)

# Create the histogram with breaks
hist(t$Global_active_power, breaks = 20, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")



