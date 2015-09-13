## Make plot 1

# How to run:
# source("plot1.R")
# plot1()
# output: plot1.png

plot1 <- function() {
	
	# We will only be using data from the dates 2007-02-01 and 2007-02-02
	
	lines1 <- readLines("household_power_consumption.txt")
	sub_lines <- c(grep("^(1/2/2007)", lines1), grep("^(2/2/2007)", lines1))
	data2 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = sub_lines[1] - 1, nrows = length(sub_lines))
	header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

	## Apply column names
	colnames(data2) <- unlist(header)

	png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
	hist(data2$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
	dev.off()
	
	
}	



