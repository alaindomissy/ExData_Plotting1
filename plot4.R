# Plot 4

hpc<- read.table('../household_power_consumption.txt', sep=';', header=T, colClasses = c('character', 'character','numeric', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric'), na.strings='?')

hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

hpc <- subset(hpc, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

png(file="plot4.png", height=480, width=480)

par( mfrow=c(2,2) )

plot( hpc$DateTime, hpc$Global_active_power, main="", xlab="",         ylab="Global active power",   type="l" )

plot( hpc$DateTime, hpc$Global_active_power, main="", xlab="datetime", ylab="Voltage",               type="l" )

plot(hpc$DateTime, hpc$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(hpc$DateTime, hpc$Sub_metering_1)
lines(hpc$DateTime, hpc$Sub_metering_2, col='red')
lines(hpc$DateTime, hpc$Sub_metering_3, col='blue')

plot( hpc$DateTime, hpc$Global_active_power, main="", xlab="datetime", ylab="Global_Reactive_Power", type="l" )

dev.off()
