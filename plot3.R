library(dplyr)
#library( ggplot2)

#Define la URL de descarga y nombre de archivo 
#Define the download URL and file name


URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile <- "CourseDataset.zip"

# realiza la descarga y descomprime el archivo
# Download and unzip the file

download.file(URL, destfile = destFile, mode='wb')
unzip(destFile)


# carga el archivo en Mydata y cambia el formato del campo DATE
mydata <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = c('', '?'))

mydata$FullDate <- strptime(paste(mydata$Date, " " , mydata$Time), '%d/%m/%Y %H:%M:%S')
mydata$Date <- as.Date(mydata$Date, '%d/%m/%Y')



png(file="plot3.png", width = 480, height = 480)
plot(mydataSelect$FullDate, mydataSelect$Sub_metering_1, 
     type = "l",
     lwd = 1, 
     col = "black",
     ylab = "Energy Sub metering",
     xlab = "")
points( mydataSelect$FullDate, mydataSelect$Sub_metering_2, 
        type = "l", 
        lwd = 1, 
        col = "blue")
points( mydataSelect$FullDate, mydataSelect$Sub_metering_3, 
        type = "l",
        lwd = 1, 
        col = "red"
)
legend("topright",
       lwd = c(1, 1, 1),
       col=c("black","blue","red"),
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()
