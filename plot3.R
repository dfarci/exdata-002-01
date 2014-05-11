plot3 <- function() {
  myfile <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  mydate1 <- strptime("01/02/2007", format='%d/%m/%Y')
  mydate2 <- strptime("02/02/2007", format='%d/%m/%Y')
  myfile <- subset(myfile, strptime(myfile$Date, format='%d/%m/%Y')>=mydate1 & strptime(myfile$Date, format='%d/%m/%Y')<=mydate2)
  Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME", "en_US.utf8")
  myfile$DateTime <- strptime(paste(myfile$Date, myfile$Time), format='%d/%m/%Y %H:%M:%S')
  png(file="plot3.png",width=480,height=480)
  plot(myfile$DateTime, myfile$Sub_metering_1/1000 ,type="l", ylab="Energy sub metering", xlab="datetime", main="")
  lines(myfile$DateTime, myfile$Sub_metering_2/1000 ,type="l", col="red")
  lines(myfile$DateTime, myfile$Sub_metering_3/1000 ,type="l", col="blue")
  legend("topright", lty = 1, col = c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,box.col = "white")
  dev.off()
}

plot3()
