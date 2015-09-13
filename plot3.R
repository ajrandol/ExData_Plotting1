## Make plot 3

# How to run:
# source("plot3.R")
# plot3()
# output: plot3.png

plot3 <- function() {
	
	# We will only be using data from the dates 2007-02-01 and 2007-02-02
	
	lines1 <- readLines("household_power_consumption.txt")
	sub_lines <- c(grep("^(1/2/2007)", lines1), grep("^(2/2/2007)", lines1))
	data2 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = sub_lines[1] - 1, nrows = length(sub_lines))
	header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

	## Apply column names
	colnames(data2) <- unlist(header)
	
	## Covert date and time to datetime
	data2$DateTime <- as.POSIXct(strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S"))

	png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
	
	plot(data2$DateTime,data2$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
	lines(x=data2$DateTime,y=data2$Sub_metering_2, type="l",col="red")
	lines(x=data2$DateTime,y=data2$Sub_metering_3, type="l",col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
	dev.off()
	
}	



