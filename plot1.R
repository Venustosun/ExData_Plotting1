A <- read.table("household_power_consumption.txt", sep = ';', head = T, na.strings = '?')
library(dplyr)
elecdata <- filter(A,A$Date %in% c("1/2/2007", "2/2/2007"))
## plot 1
GAP <- as.numeric(elecdata[, "Global_active_power"])
png("Plot 1.png", height = 480, width = 480)
hist(GAP, xlab = "Global active power (kilowatts)", ylab = "frequency", main="Global Active Power", col = "red")
dev.off()
