##loading data
test <- read.table("exploratoryDataAnalysis//data//household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")

test$Date <- as.Date(test$Date, "%d/%m/%Y")

testdata <- test[test[,1] == "2007-02-01",]

testdata <- rbind(testdata, test[test[,1] == "2007-02-02",])

testdata$Global_active_power <- as.numeric(testdata$Global_active_power)
testdata$Global_reactive_power <- as.numeric(testdata$Global_reactive_power)
testdata$Global_intensity <- as.numeric(testdata$Global_intensity)
testdata$Sub_metering_1 <- as.numeric(testdata$Sub_metering_1)
testdata$Sub_metering_2 <- as.numeric(testdata$Sub_metering_2)
testdata$Sub_metering_3 <- as.numeric(testdata$Sub_metering_3)

datetime <- paste(testdata$Date, testdata$Time)
datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

##plots

par(mfrow = c(1,1))

plot(datetime, testdata$Sub_metering_1, type = "l" , col = "black", ylab = "Energy sub metering", xlab = "")   # Put Sub_metering_1 column
lines(datetime, testdata$Sub_metering_2, type = "l" , col = "red")  # Put Sub_metering_2 column
lines(datetime, testdata$Sub_metering_3, type = "l" , col = "blue") # Put Sub_metering_3 column

png(file = "./plot3.png", width = 480, height = 480, units = "px")
plot(datetime, testdata$Sub_metering_1, type = "l" , col = "black", ylab = "Energy sub metering", xlab = "")   # Put Sub_metering_1 column
lines(datetime, testdata$Sub_metering_2, type = "l" , col = "red")  # Put Sub_metering_2 column
lines(datetime, testdata$Sub_metering_3, type = "l" , col = "blue") # Put Sub_metering_3 column
dev.off()
