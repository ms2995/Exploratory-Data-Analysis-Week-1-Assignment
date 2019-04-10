power_full <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")  #reading the data
power_sub <- subset(power_full, Date %in% c("1/2/2007","2/2/2007"))    #subsetting required rows
power_sub$Date <- as.Date(power_sub$Date, format="%d/%m/%Y")      #setting date in the date class

png("plot2.png", width=480, height=480)  #saving plot in a png file

power_sub <- cbind(power_sub, "DateTime" = as.POSIXct(paste(power_sub$Date, power_sub$Time)))

plot(power_sub$Global_active_power ~ power_sub$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
