# www.coursera.com
# Exploratory Data Analysis
# Assignment 1
# Saskia Schirmer, 6th octobre 2015
# plot 1

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
## generate plot 1
###################
png(file = "plot1.png")
  hist(household$Global_active_power, main = "Global active power", 
       xlab = "Global active power (kilowatts)", col = "red")
dev.off()