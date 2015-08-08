library(sqldf)

# read data for specific dates
dataFile <- file("./exdata_data_household_power_consumption/household_power_consumption.txt")
df <- sqldf("select * from dataFile where Date in ('1/2/2007', '2/2/2007')", file.format = list(header=TRUE, sep=";"))

# convert the Date and Time variables to Date/Time classes
dates <- df$Date
times <- df$Time
dateTime <- paste(dates, times)
df$dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")

# close connection
sqldf()   

# Plot generic X-Y graph in PNG format
png(file="plot2.png", width=480, height=480, units="px")
plot(df$dateTime, df$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")

# close the device
dev.off()
