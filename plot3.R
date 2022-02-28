Pconsum <- read.table("household_power_consumption.txt", 
                      header=TRUE, 
                      sep=";",
                      colClasses=c("character", "character", rep("numeric", 7)),
                      na.strings="?")

Pconsum$Time <- strptime(paste(Pconsum$Date, Pconsum$Time),
                         "%d/%m/%Y %H:%M:%S")
Pconsum$Date <- as.Date(Pconsum$Date, "%d/%m/%Y")

TargetData <- subset(Pconsum, Date=="2007-02-01" | Date=="2007-02-02")

png("plot3.png", width=480, height=480)
plot(TargetData$Time, TargetData$Sub_metering_1, 
     type="l", col="black", xlab="", ylab="Enegy sub metering",
     ylim=c(0,38))
par(new=T)
plot(TargetData$Time, TargetData$Sub_metering_2,
     type="l", col="red", xlab="", ylab="",
     ylim=c(0,38))
par(new=T)
plot(TargetData$Time, TargetData$Sub_metering_3,
     type="l", col="blue", xlab="", ylab="",
     ylim=c(0,38))
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()



