
##Read in Table - set columnames, separator and string character used in this dataset

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#load the subset via dates, then combine together into one matrix

subdata <- subset(data, data$Date == "1/2/2007")

subdata2 <- subset(data, data$Date == "2/2/2007")

plotdata <- rbind(subdata, subdata2)

#Generate the histogram - first open file with desired file dimensions
#Then, generate histogram

png(filename = "plot1.png",
     width = 480, height = 480, units = "px")
     
hist(plotdata$Global_active_power, col = "red", 
		main = paste("Global Active Power"), 
		xlab = paste("Global Active Power (kilowatts)"))
		
dev.off()    
    
    
