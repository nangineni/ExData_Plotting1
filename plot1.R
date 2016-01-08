
## Get data from dataset in working library
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

## convert Date field in to Date data type so that we can do comparisions

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## get dataset for only two days 2/1/2007 and 2/2/2007

data2 <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
rm(data) ## remove the original data so that memory won't be full
png("plot1.png", width=480, height=480)

## Can only use numeric fields for histogram so used as.numeric
## However Global_active_power column is a 'factor' and cannot use it directly in as.numeric.
## so first convert it in to as.character and then as.numeric.
hist(as.numeric(as.character(data2$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )

## File will only be created once you turnoff device.
dev.off()