library(dplyr)
library( ggplot2)

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

mydata$Date <- strptime(paste(mydataSelect$Date, " " , mydataSelect$Time), '%Y-%m-%d %H:%M:%S')

# selecciona los datos a graficar
mydataSelect <- subset(mydata, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

png(file="plot1.png", width = 480, height = 480)

hist(mydataSelect$Global_active_power, 
     col = "red", 
     main = "Global active Power", 
     ylab = "Frecuency",
     xlab = "Global active power (Kilowatts)")
dev.off()
