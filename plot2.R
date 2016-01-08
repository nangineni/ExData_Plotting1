
## Get data from dataset in working library
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

## convert Date field in to Date data type so that we can do comparisions

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## get dataset for only two days 2/1/2007 and 2/2/2007

data2 <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
rm(data) ## remove the original data so that memory won't be full
png("plot2.png", width=480, height=480)
## Plot is eventually showing data for during the day each day. If you use just days you only get two vertical lines 
## So get a field which has the data for both date and time and convert it in to Time format using POSIXct.
datetime<- paste(data2$Date, data2$Time)
data2$Datetime <- as.POSIXct(datetime)

## typle = 'l' for line. As GLobal_active_power is a factor so converting it in to character and then numeric.

plot(data2$Datetime, as.numeric(as.character(data2$Global_active_power)), type = "l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()