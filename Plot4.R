dataR<-read.table("Week 1 Project/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

dataR$V1<-gsub("/","-",dataR$V1)
working<-subset(dataR, dataR$V1=="1-2-2007")
working2<-subset(dataR, dataR$V1=="2-2-2007")
working<-rbind(working, working2)

rm("dataR")
rm("working2")

require(lubridate)
working$DateTime<-dmy_hms(paste(working$V1, working$V2))

globalActive<- as.numeric(working$V3)
globalReactive<- as.numeric(working$V4)
voltage<-as.numeric(working$V5)
subMet1<-as.numeric(working$V7)
subMet2<-as.numeric(working$V8)
subMet3<-as.numeric(working$V9)
dateTime<-working$DateTime

par(mfrow=c(2,2))

plot(dateTime, globalActive, type = "l", xlab = "", ylab = "Global Active Power")

plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateTime, subMet1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMet2, type="l", col="red")
lines(dateTime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateTime, globalReactive, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, "Week 1 Project/Household Power Consumption/plot3.png")
dev.off()
dev.off()

rm("working", "dateTime", "globalActive", "globalReactive", "subMet1", "subMet2", "subMet3", "voltage")