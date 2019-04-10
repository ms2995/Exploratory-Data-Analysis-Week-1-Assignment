power_full <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")  #reading the data
power_sub <- subset(power_full, Date %in% c("1/2/2007","2/2/2007"))    #subsetting required rows
power_sub$Date <- as.Date(power_sub$Date, format="%d/%m/%Y")      #setting date in the date class

png("plot1.png", width=480, height=480)  #saving plot in a png file

hist(power_sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") #plotting histogram
dev.off()