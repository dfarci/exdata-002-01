plot1 <- function() {
  myfile <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  mydate1 <- strptime("01/02/2007", format='%d/%m/%Y')
  mydate2 <- strptime("02/02/2007", format='%d/%m/%Y')
  myfile <- subset(myfile, strptime(myfile$Date, format='%d/%m/%Y')>=mydate1 & strptime(myfile$Date, format='%d/%m/%Y')<=mydate2)
  Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME", "en_US.utf8")
  png(file="plot1.png",width=480,height=480)
  hist(myfile$Global_active_power/1000, col=c("red"), xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
}

plot1()
