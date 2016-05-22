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
pwr_consptn_GRP <- as.numeric(household_pwr_cnsmptn_reqd$Global_reactive_power)
pwr_consptn_voltage <- as.numeric(household_pwr_cnsmptn_reqd$Voltage)
reqd_daytime <- strptime(paste(household_pwr_cnsmptn_reqd$Date,household_pwr_cnsmptn_reqd$Time, sep = ""),"%Y-%m-%d %H:%M:%S")
submetering1 <- as.numeric(household_pwr_cnsmptn_reqd$Sub_metering_1)
submetering2 <- as.numeric(household_pwr_cnsmptn_reqd$Sub_metering_2)
submetering3 <- as.numeric(household_pwr_cnsmptn_reqd$Sub_metering_3)

##plot the graph
png("Plot4.png", width=480, height=480)
par(mfcol = c(2,2))

## plot1
plot(reqd_daytime, pwr_cnsmptn_GAP, type="l", xlab="", ylab="Global Active Power")

## Plot2
plot(reqd_daytime, submetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(reqd_daytime, submetering2, col="red")
lines(reqd_daytime, submetering3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Plot 3

plot(reqd_daytime, pwr_consptn_voltage, type="l", xlab="datetime", ylab="Voltage")

##Plot 4

plot(reqd_daytime, pwr_consptn_GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()