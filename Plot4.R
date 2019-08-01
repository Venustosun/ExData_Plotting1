png("Plot 4.png",height = 480, width = 480)
par(mfrow=c(2,2))
elecdata$DateTime <- strptime(paste(elecdata$Date, elecdata$Time, sep = ""), format = "%d/%m/%Y %H:%M:%S")
library(lubridate)
DateTime <- paste(elecdata$Date, elecdata$Time)
B <- dmy_hms(DateTime)
## 1-1
GAP2 <- as.numeric(elecdata[, "Global_active_power"])
plot(B, GAP2, type = "l", xlab = "", ylab = "Global Active Power")
##1-2
V <- elecdata[,5]
plot(B,V,type = "l", xlab ="", ylab = "Voltage")
##2-1
sub1 <- elecdata[,7]
sub2 <- elecdata[,8]
sub3 <- elecdata[,9]
plot(B, sub1, type = "l", xlab = "", ylab = "Energy sub metering" )
lines(B, sub2, col = "red")
lines(B, sub3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black", "red", "blue"),lty =c(1,1,1))
##2-2
GRP <- elecdata[,4]
plot(B,GRP,type = "l", xlab = "", ylab = "Global_reactive_power" )
dev.off()
