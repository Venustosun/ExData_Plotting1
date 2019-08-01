A <- read.table("household_power_consumption.txt", sep = ';', head = T, na.strings = '?')
library(dplyr)
elecdata <- filter(A,A$Date %in% c("1/2/2007", "2/2/2007"))
elecdata$DateTime <- strptime(paste(elecdata$Date, elecdata$Time, sep = ""), format = "%d/%m/%Y %H:%M:%S")
png("Plot 3.png", height = 480, width = 480)
elecdata$DateTime <- strptime(paste(elecdata$Date, elecdata$Time), format = "%d/%m/%Y %H:%M:%S") 
library(lubridate)
DateTime <- paste(elecdata$Date, elecdata$Time)
B <- dmy_hms(DateTime)
sub1 <- elecdata[,7]
sub2 <- elecdata[,8]
sub3 <- elecdata[,9]
plot(B, sub1, type = "l", xlab = "", ylab = "Energy sub metering" )
lines(B, sub2, col = "red")
lines(B, sub3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black", "red", "blue"),lty =c(1,1,1))
dev.off()
