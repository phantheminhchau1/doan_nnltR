df <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-07-2021.csv")
df <- df[complete.cases(df[ , c("Lat","Long_")] ), ]  
df <-df[!(df$Lat < 30|df$Long_ < -140),]
library(ggplot2)
library(tidyverse)
library(fiftystater)

df %>% glimpse()
data("fifty_states")
ggplot() + geom_polygon( data=fifty_states, aes(x=long, y=lat, group = group),color="white", fill="grey10" )

ggplot() + geom_polygon(data=fifty_states, aes(x=long, y=lat, group = group),color="white", fill="grey92" ) + 
  geom_point(data=df, aes(x=Long_, y=Lat, size = Confirmed), color="black") + 
  scale_size(name="", range = c(1, 15)) + 
  guides(size=guide_legend("Số ca mắc:")) +
  theme_void()
