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
png(file="plot3.png", width=480, height=480, units="px")
plot(df$dateTime, df$Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering", col="black")
lines(df$dateTime, df$Sub_metering_2, type="l", col="red")
lines(df$dateTime, df$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

# close the device
dev.off()  
