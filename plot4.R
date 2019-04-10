power_full <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")  #reading the data
power_sub <- subset(power_full, Date %in% c("1/2/2007","2/2/2007"))    #subsetting required rows
power_sub$Date <- as.Date(power_sub$Date, format="%d/%m/%Y")      #setting date in the date class

png("plot4.png", width=480, height=480)  #saving plot in a png file

par(mfrow=c(2,2))
plot(power_sub$Global_active_power ~ power_sub$DateTime, type="l")

plot(power_sub$Voltage ~ power_sub$DateTime, type="l")

with(power_sub, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(power_sub$Sub_metering_2 ~ power_sub$DateTime, col = 'Red')
lines(power_sub$Sub_metering_3 ~ power_sub$DateTime, col = 'Blue')

plot(power_sub$Global_reactive_power ~ power_sub$DateTime, type="l")

dev.off()
