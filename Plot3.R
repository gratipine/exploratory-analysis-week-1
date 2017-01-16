dataR<-read.table("Week 1 Project/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

dataR$V1<-gsub("/","-",dataR$V1)
working<-subset(dataR, dataR$V1=="1-2-2007")
working2<-subset(dataR, dataR$V1=="2-2-2007")
working<-rbind(working, working2)

rm("dataR")
rm("working2")

require(lubridate)
working$DateTime<-dmy_hms(paste(working$V1, working$V2))

plot(working$DateTime, as.numeric(working$V7), type="l", ylab = "Energy sub metering", xlab="")
lines(working$DateTime, as.numeric(working$V8), type="l", col="red")
lines(working$DateTime, as.numeric(working$V9), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png, "Week 1 Project/Household Power Consumption/plot3.png")
dev.off()
dev.off()

rm("working")