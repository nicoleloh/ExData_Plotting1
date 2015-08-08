library(sqldf)

# read data for specific dates
dataFile <- file("./exdata_data_household_power_consumption/household_power_consumption.txt")
df <- sqldf("select * from dataFile where Date in ('1/2/2007', '2/2/2007')", file.format = list(header=TRUE, sep=";"))

# close connection
sqldf()

# Plot histogram graph in PNG format
png(file="plot1.png", width=480, height=480, units="px")
hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# close the device
dev.off()