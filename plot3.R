data<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

png("plot3.png", width=480, height= 480)
plot(data$DateTime, data$Sub_metering_1, type= "l", lwd=1, ylab= "Energy sub metering", xlab="", col = "black")
lines(data$DateTime, data$Sub_metering_2, type= "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type= "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =1)
dev.off()