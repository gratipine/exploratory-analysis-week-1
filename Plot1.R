dataR<-read.table("Week 1 Project/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

dataR$V1<-gsub("/","-",dataR$V1)
working<-subset(dataR, dataR$V1=="1-2-2007")
working2<-subset(dataR, dataR$V1=="2-2-2007")
working<-rbind(working, working2)

rm("dataR")
rm("working2")

hist(as.numeric(working$V3), main = "Global Active Power", col="red", 
     xlab="Global Active Power (kilowatts)", ylim=c(0,1200))

dev.copy(png, "Week 1 Project/Household Power Consumption/plot1.png")

dev.off()
dev.off()

rm("globalPower", "working")