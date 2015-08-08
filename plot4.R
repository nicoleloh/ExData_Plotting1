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

# Plot graphs in PNG format
png(file="plot4.png", width=480, height=480, units="px")

# 4 plots
par(mfrow = c(2, 2))

# plot #1, top left
plot(df$dateTime, df$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power")

# plot #2, top right
plot(df$dateTime, df$Voltage, type="l", main="", xlab="datetime", ylab="Voltage")

# plot #3, bottom left
plot(df$dateTime, df$Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering", col="black")
lines(df$dateTime, df$Sub_metering_2, type="l", col="red")
lines(df$dateTime, df$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

# plot #4, bottom right
plot(df$dateTime, df$Global_reactive_power, type="l", main="", xlab="datetime", ylab="Global_reactive_power")

# close the device
dev.off()  



