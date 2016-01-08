# get names and start date/time
df <- read.csv2("household_power_consumption.txt", nrows=2)
col_names <- names(df)
df <- read.csv2("household_power_consumption.txt", nrows=2880, skip=66636, dec=".")
names(df) <- col_names


d_t <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
ddf <- cbind(d_t, df)
names(ddf)[1] <- "Datetime"

# Plot 3
png("plot3.png")
plot(ddf$Datetime, ddf$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy Sub Metering")
lines(ddf$Datetime, ddf$Sub_metering_2, type="l", col="red")
lines(ddf$Datetime, ddf$Sub_metering_3, type="l", col="Blue")
legend("topright", legend=names(ddf[8:10]), 
       lty=c(1,1,1), 
       col=c("black", "red", "Blue"),
       cex=0.8)
dev.off()

