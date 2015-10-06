# www.coursera.com
# Exploratory Data Analysis
# Assignment 1
# Saskia Schirmer, 6th octobre 2015
# plot 4

################
## read data in
################

tab <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                  na.strings = "?", stringsAsFactors = FALSE)

# select 2-day-period
sub1 <- subset(tab, tab$Date == "1/2/2007")
sub2 <- subset(tab, tab$Date == "2/2/2007")
household <- rbind(sub1, sub2)

# reformat date and time
dates <- household$Date
times <- household$Time
x <- paste(dates, times)
household$dateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")


###################
## generate plot 4
###################

png(file = "plot4.png")

  par(mfrow = c(2,2))
  
    plot(household$dateTime, household$Global_active_power, type = "l",
         ylab = "Global Active Power (kilowatt)", xlab = "")
    
    plot(household$dateTime, household$Voltage, type = "l", 
         ylab = "Voltage", xlab = "datetime")
    
    plot(household$dateTime, household$Sub_metering_1, type = "l", 
         ylab = "Energy household metering", xlab = "")
    lines(household$dateTime, household$Sub_metering_2, col = "red")
    lines(household$dateTime, household$Sub_metering_3, col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), 
           legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
    
    plot(household$dateTime, household$Global_reactive_power, type = "l", 
         ylab = "Global reactive power (kilowatt)", xlab = "datetime")    

dev.off()