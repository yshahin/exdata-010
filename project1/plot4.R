#source("load_data.R")
data <- data.load()

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#topleft
with(data, {
  plot(Time, Global_active_power, type="l",
       ylab="Global Active Power", xlab="")
})

#topright
with(data, {
  plot(Time, Voltage, type="l",
       ylab="Voltage", xlab="datetime")
})

#bottomleft
with(data, {
  plot(Time, Sub_metering_1, type="l",
       ylab="Energy sub metering", xlab="")
  points(Time, Sub_metering_2, type = "l", col="red")
  points(Time, Sub_metering_3, type = "l", col="blue")
  legend("topright", col=c("black", "red", "blue"), lwd=2, box.lwd=0,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

#bottomright
with(data, {
  plot(Time, Global_reactive_power, type="l", xlab="datetime")
})
dev.off()
