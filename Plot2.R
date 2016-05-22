## check the working and set the working directory accordingly
WD <- getwd()
if (WD != "/Users/sudilkumar/Documents/exploratory data analysis/week1"){
  setwd("/Users/sudilkumar/Documents/exploratory data analysis/week1")
}
## loading and filtering the DATA
household_pwr_cnsmptn <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE, dec = ".")
household_pwr_cnsmptn$Date <- as.Date(household_pwr_cnsmptn$Date, "%d/%m/%Y")
household_pwr_cnsmptn_reqd <- household_pwr_cnsmptn[(household_pwr_cnsmptn$Date >= "2007-02-01" & household_pwr_cnsmptn$Date <= "2007-02-02"),]
pwr_cnsmptn_GAP <- as.numeric(household_pwr_cnsmptn_reqd$Global_active_power)
reqd_daytime <- strptime(paste(household_pwr_cnsmptn_reqd$Date,household_pwr_cnsmptn_reqd$Time, sep = ""),"%Y-%m-%d %H:%M:%S")

##plot the graph
png("plot2.png", width=480, height=480)
plot(reqd_daytime, pwr_cnsmptn_GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()