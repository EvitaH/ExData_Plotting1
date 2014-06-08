
##Read in Table - set columnames, separator and string character used in this dataset

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#load the subset via dates, then combine together into one matrix

subdata <- subset(data, data$Date == "1/2/2007")

subdata2 <- subset(data, data$Date == "2/2/2007")

plotdata <- rbind(subdata, subdata2)

#So Date and Time can be associated: need to be read in as one
#First: combine the columns into one
plotdata$FullDate <- paste(plotdata$Date, plotdata$Time)

#Give R the format so it recognizes the full Date + Time
plotdata$FullDate <- strptime(test, format = "%d/%m/%Y %H:%M:%S")

#Generate the plot - first open file with desired file dimensions
#Then, generate plot

png(filename = "plot2.png",
     width = 480, height = 480, units = "px")

plot(plotdata$FullDate, plotdata$Global_active_power, 
	type = "l", ylab = paste("Global Active Power (kilowatts)"), xlab = "")
	
dev.off()