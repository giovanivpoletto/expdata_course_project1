##Loading data
test <- read.table("data//household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")

test$Date <- as.Date(test$Date, "%d/%m/%Y")

testdata <- test[test[,1] == "2007-02-01",]

testdata <- rbind(testdata, test[test[,1] == "2007-02-02",])

testdata$Global_active_power <- as.numeric(testdata$Global_active_power)
testdata$Global_reactive_power <- as.numeric(testdata$Global_reactive_power)
testdata$Global_intensity <- as.numeric(testdata$Global_intensity)
testdata$Sub_metering_1 <- as.numeric(testdata$Sub_metering_1)
testdata$Sub_metering_2 <- as.numeric(testdata$Sub_metering_2)
testdata$Sub_metering_3 <- as.numeric(testdata$Sub_metering_3)

##plots

par(mfrow = c(1,1))

hist(testdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)" , col = "red")

png(file = "./plot1.png", width = 480, height = 480, units = "px")
hist(testdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)" , col = "red")
dev.off()
