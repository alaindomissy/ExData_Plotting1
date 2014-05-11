# Plot 3

hpc<- read.table('../household_power_consumption.txt', sep=';', header=T, colClasses = c('character', 'character','numeric', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric'), na.strings='?')

hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

hpc <- subset(hpc, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

png(file="plot3.png", height=480, width=480)

par( mfrow=c(1,1) )
plot(hpc$DateTime, hpc$Sub_metering_1, xlab="",ylab="Energy sub metering", pch=NA)
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1),col = c('black', 'red', 'blue'))
lines(hpc$DateTime, hpc$Sub_metering_1)
lines(hpc$DateTime, hpc$Sub_metering_2, col='red')
lines(hpc$DateTime, hpc$Sub_metering_3, col='blue')

dev.off()

