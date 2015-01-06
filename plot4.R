png(filename = "plot4.png", width = 480, height = 480)

# Read in data and convert Date column from character to Date
data_raw = read.table('household_power_consumption.txt', sep=';', na.strings = '?', header = T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data_raw$Date = as.Date(data_raw$Date, "%d/%m/%Y")

# Subset data
data = subset(data_raw, Date >= as.Date("01/02/2007", "%d/%m/%Y") & Date <= as.Date("02/02/2007", "%d/%m/%Y"))

# Create index for x axis
start_friday = which(weekdays(data$Date) == "Friday")[1]
start_saturday = length(data$Date)

# Set options that are equal for all subplots
par(mfrow = c(2,2))

# Make plot
with(data, {
  # Plot 1
  plot(Global_active_power, type="l", ylab="Global Active Power", xaxt = "n", xlab = NA)
  axis(side=1, at = c(1, start_friday, start_saturday), labels=c("Thu", "Fri", "Sat"))
  
  # Plot 2
  plot(Voltage, type='l', ylab = "Voltage", xlab = "datetime", xaxt = "n")
  axis(side=1, at = c(1, start_friday, start_saturday), labels=c("Thu", "Fri", "Sat"))
  
  # Plot 3
  plot(Sub_metering_1, type="l", ylab="Energy sub metering", xaxt = "n", xlab = NA)
  points(Sub_metering_2, type="l", col="red")
  points(Sub_metering_3, type="l", col="blue")
  legend("topright", bty = "n", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid")
  axis(side=1, at = c(1, start_friday, start_saturday), labels=c("Thu", "Fri", "Sat"))
  
  # Plot 4
  plot(data$Global_reactive_power, type='l', xaxt = "n", ylab = "Global_reactive_power", xlab = "datetime")
  axis(side=1, at = c(1, start_friday, start_saturday), labels=c("Thu", "Fri", "Sat"))
})

# Close file
dev.off()