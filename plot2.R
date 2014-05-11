plot2 <- function() {
  myfile <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  mydate1 <- strptime("01/02/2007", format='%d/%m/%Y')
  mydate2 <- strptime("02/02/2007", format='%d/%m/%Y')
  myfile <- subset(myfile, strptime(myfile$Date, format='%d/%m/%Y')>=mydate1 & strptime(myfile$Date, format='%d/%m/%Y')<=mydate2)
  Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME", "en_US.utf8")
  myfile$DateTime <- strptime(paste(myfile$Date, myfile$Time), format='%d/%m/%Y %H:%M:%S')
  png(file="plot2.png",width=480,height=480)
  plot(myfile$DateTime, myfile$Global_active_power/1000,type="l", ylab="Global Active Power (kilowatts)", xlab="", main="")
  dev.off()
}

plot2()
