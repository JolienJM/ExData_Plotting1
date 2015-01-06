# Open file
png(filename = "plot2.png", width = 480, height = 480)

# Read in data and convert Date column from character to Date
data_raw = read.table('household_power_consumption.txt', sep=';', na.strings = '?', header = T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data_raw$Date = as.Date(data_raw$Date, "%d/%m/%Y")

# Subset data
data = subset(data_raw, Date >= as.Date("01/02/2007", "%d/%m/%Y") & Date <= as.Date("02/02/2007", "%d/%m/%Y"))

# Create index for x axis
start_friday = which(weekdays(data$Date) == "Friday")[1]
start_saturday = length(data$Date)

# Make plot
plot(data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xaxt = "n", xlab = NA)
axis(side=1, at = c(1, start_friday, start_saturday), labels=c("Thu", "Fri", "Sat"))

# Close file
dev.off()