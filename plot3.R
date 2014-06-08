
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
png(filename = "plot3.png",
     width = 480, height = 480, units = "px")

#Plotting: first, make empty plot with the dimensions I want for the Figure
#Giving R the data so plot window gets generated properly
#Dimensions for y adjusted with ylim
plot(plotdata$FullDate, plotdata$Sub_metering_1 + plotdata$Sub_metering_2 + plotdata$Sub_metering_3, 
type = "n", xlab = "", ylab = paste("Energy sub metering"), ylim = c(0,38))

#Add my points sequentially
points(plotdata$FullDate, plotdata$Sub_metering_1, type = "l", col = "black")
points(plotdata$FullDate, plotdatatime$Sub_metering_2, type = "l", col = "red")
points(plotdata$FullDate, plotdatatime$Sub_metering_3, type = "l", col = "blue")

#Add legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#bty = "n"

dev.off()

