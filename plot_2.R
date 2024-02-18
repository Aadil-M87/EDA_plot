setwd("C:/Users/Hawking's/PycharmProjects/pythonProject3/household_power_consumption_ex")
t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

t$Date <- as.Date(t$Date, "%d/%m/%Y")

t <- subset(t, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

t <- na.omit(t)

t$DateTime <- as.POSIXct(paste(t$Date, t$Time), format="%Y-%m-%d %H:%M:%S")

t <- t[, !(names(t) %in% c("Date", "Time"))]

summary(t)

unique(t$Global_active_power)

head(t)

## Create Plot 2
plot(t$Global_active_power~t$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
