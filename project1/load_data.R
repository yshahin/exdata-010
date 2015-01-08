data.load <- function() {
  header <- strsplit(readLines("household_power_consumption.txt", n=1), split=";")[[1]]
  data <- read.csv("household_power_consumption.txt",
                   sep = ";", na.strings = "?",
                   skip = grep("^[12]/2/2007;",
                               readLines("household_power_consumption.txt")),
                   nrows = 2880)
  names(data) <- header
  data <- transform(data, Time=strptime(paste(Date, Time), "%d/%m/%Y %T"))  
  data <- transform(data, Date=as.Date(strptime(Date, "%d/%m/%Y")))
  data
}