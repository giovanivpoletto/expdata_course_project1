##loading data
test <- read.table("exploratoryDataAnalysis//data//household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")

test$Date <- as.Date(test$Date, "%d/%m/%Y") ## parse char to date

testdata <- test[test[,1] == "2007-02-01",] ## subsetting data

testdata <- rbind(testdata, test[test[,1] == "2007-02-02",]) ## subsetting data

testdata$Global_active_power <- as.numeric(testdata$Global_active_power) ## parse char to numeric
testdata$Global_reactive_power <- as.numeric(testdata$Global_reactive_power) ## parse char to numeric
testdata$Global_intensity <- as.numeric(testdata$Global_intensity) ## parse char to numeric
testdata$Sub_metering_1 <- as.numeric(testdata$Sub_metering_1) ## parse char to numeric
testdata$Sub_metering_2 <- as.numeric(testdata$Sub_metering_2) ## parse char to numeric
testdata$Sub_metering_3 <- as.numeric(testdata$Sub_metering_3) ## parse char to numeric

datetime <- paste(testdata$Date, testdata$Time) ## processing timestamp
datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S") ## processing timestamp

##plots

par(mfrow = c(2,2)) ## multiple plots

plot(datetime, testdata$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "") ## first plot

plot(datetime, testdata$Voltage, type = "l", ylab = "Voltage") ## second plot

plot(datetime, testdata$Sub_metering_1, type = "l" , col = "black", ylab = "Energy sub metering", xlab = "")  ## third plot starting with sub metering 1
lines(datetime, testdata$Sub_metering_2, type = "l" , col = "red")  ## add sub metering 2
lines(datetime, testdata$Sub_metering_3, type = "l" , col = "blue") ## add sub metering 3

plot(datetime, testdata$Global_reactive_power, type = "l", ylab = "Global_reactive_power") ## fourth plot 

png(file = "./plot4.png", width = 480, height = 480, units = "px") ## creating a file with plots
par(mfrow = c(2,2)) ## multiple plots

plot(datetime, testdata$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "") ## first plot

plot(datetime, testdata$Voltage, type = "l", ylab = "Voltage") ## second plot

plot(datetime, testdata$Sub_metering_1, type = "l" , col = "black", ylab = "Energy sub metering", xlab = "")  ## third plot starting with sub metering 1
lines(datetime, testdata$Sub_metering_2, type = "l" , col = "red")  ## add sub metering 2
lines(datetime, testdata$Sub_metering_3, type = "l" , col = "blue") ## add sub metering 3

plot(datetime, testdata$Global_reactive_power, type = "l", ylab = "Global_reactive_power") ## fourth plot 

dev.off() ## ending file
