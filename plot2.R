# get names and start date/time
df <- read.csv2("household_power_consumption.txt", nrows=2)
col_names <- names(df)
df <- read.csv2("household_power_consumption.txt", nrows=2880, skip=66636, dec=".")
names(df) <- col_names


d_t <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
ddf <- cbind(d_t, df)
names(ddf)[1] <- "Datetime"

# Plot 2
png("plot2.png")
plot(ddf$Datetime, ddf$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

