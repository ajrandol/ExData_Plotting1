## Make plot 2

# How to run:
# source("plot2.R")
# plot2()
# output: plot2.png

plot2 <- function() {
	
	# We will only be using data from the dates 2007-02-01 and 2007-02-02
	
	lines1 <- readLines("household_power_consumption.txt")
	sub_lines <- c(grep("^(1/2/2007)", lines1), grep("^(2/2/2007)", lines1))
	data2 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = sub_lines[1] - 1, nrows = length(sub_lines))
	header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

	## Apply column names
	colnames(data2) <- unlist(header)
	
	## Covert date and time to datetime
	data2$DateTime <- as.POSIXct(strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S"))

	png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
	plot(data2$DateTime,data2$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
	dev.off()
	
}	



