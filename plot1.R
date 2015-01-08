header <- strsplit(readLines("household_power_consumption.txt", n=1), split=";")[[1]]
data <- read.csv("household_power_consumption.txt",
                 sep = ";", na.strings = c("?"),
                 skip = grep("^[12]/2/2007;",
                             readLines("household_power_consumption.txt")),
                 nrows = 2880)
names(data) <- header
data <- transform(data, Date=as.Date(strptime(Date, "%d/%m/%Y")))
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col="red")
dev.off()

