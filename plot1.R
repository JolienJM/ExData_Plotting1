# Open file
png(filename = "plot1.png", width = 480, height = 480)

# Read in data and convert Date column from character to Date
data_raw = read.table('household_power_consumption.txt', sep=';', na.strings = '?', header = T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data_raw$Date = as.Date(data_raw$Date, "%d/%m/%Y")

# Subset data
data = subset(data_raw, Date >= as.Date("01/02/2007", "%d/%m/%Y") & Date <= as.Date("02/02/2007", "%d/%m/%Y"))

# Make plot
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close file
dev.off()