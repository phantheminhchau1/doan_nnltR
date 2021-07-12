setwd("C:\\Users\\phanc\\Desktop\\COVID-19\\csse_covid_19_data\\csse_covid_19_daily_reports_us")
library(data.table)  
files <- list.files(pattern = ".csv")
temp <- lapply(files, fread, sep=",")
data <- rbindlist( temp, fill=TRUE)
cali <- data[Province_State=="California"]
library("ggplot2")
options(scipen = 999)
ggplot(cali, aes(x=Last_Update, y=Confirmed)) + 
  geom_point(aes(colour = "red"))
