# Reads in data from file then subsets data for specified dates
powerDT <- data.table::fread("C:/Users/Svea/Downloads/exdata_data_household_power_consumption.zip/household_power_consumption.txt", na.strings = "?")

# Prevents histogram from printing in scientific notation
powerDT[, Global_active_power := as.numeric(Global_active_power)]

# Change Date Column to Date Type
powerDT[, Date := as.Date(Date, format = "%d/%m/%Y")]

# Filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")]

# Set up the png device for plotting
png("plot1.png", width = 480, height = 480)

# Create and display the histogram
hist(powerDT$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# Close the png device
dev.off()