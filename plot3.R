setwd("D:\\EDA\\exdata_data_household_power_consumption")

wholeData <-read.table("./household_power_consumption.txt", sep=";", header=TRUE, nrows=2075259, stringsAsFactors=FALSE)

subData <- subset(wholeData, Date=="1/2/2007" | Date=="2/2/2007")

// free up memory
rm(wholeData)	

//data conversion
subData$Global_active_power <- as.numeric(subData$Global_active_power)

x <- paste(subData$Date, subData$Time) 
DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

subData$Sub_metering_1 <- as.numeric(subData$Sub_metering_1)
subData$Sub_metering_2 <- as.numeric(subData$Sub_metering_2)
subData$Sub_metering_3 <- as.numeric(subData$Sub_metering_3)

subData$Voltage <- as.numeric(subData$Voltage)

subData$Global_reactive_power <- as.numeric(subData$Global_reactive_power)

//plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(DateTime, subData$Sub_metering_1, type ="l", xlab="", ylab="Energy sub metering", main="", col="black")
lines(DateTime, subData$Sub_metering_2, type ="l", col="red")
lines(DateTime, subData$Sub_metering_3, type ="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()