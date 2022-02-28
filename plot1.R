Pconsum <- read.table("household_power_consumption.txt", 
                      header=TRUE, 
                      sep=";",
                      colClasses=c("character", "character", rep("numeric", 7)),
                      na.strings="?")

Pconsum$Time <- strptime(paste(Pconsum$Date, Pconsum$Time),
                         "%d/%m/%Y %H:%M:%S")
Pconsum$Date <- as.Date(Pconsum$Date, "%d/%m/%Y")

TargetData <- subset(Pconsum, Date=="2007-02-01" | Date=="2007-02-02")

png("plot1.png", width=480, height=480)
hist(TargetData$Global_active_power, col="red", 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
dev.off()
