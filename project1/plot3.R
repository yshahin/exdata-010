source("load_data.R")
data <- data.load()

png("plot3.png", width = 480, height = 480)
plot(data$Time, data$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="")
points(data$Time, data$Sub_metering_2, type = "l", col="red")
points(data$Time, data$Sub_metering_3, type = "l", col="blue")
legend("topright", col=c("black", "red", "blue"), lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

