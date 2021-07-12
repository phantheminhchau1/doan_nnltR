df <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/03-04-2021.csv")
df <- df[complete.cases(df[ , c("Lat","Long_")] ), ]  
df <-df[!(df$Lat < 30|df$Long_ < -140),]
library(ggplot2)
library(tidyverse)
library(fiftystater)

df %>% glimpse()
world_map <- map_data("world")
ggplot() + geom_polygon( data=world_map, aes(x=long, y=lat, group = group),color="white", fill="grey10" )

ggplot() + geom_polygon(data=world_map, aes(x=long, y=lat, group = group),color="white", fill="grey92" ) + 
  geom_point(data=df, aes(x=Long_, y=Lat, size = Confirmed), color="red") + 
  scale_size(name="", range = c(0.1, 2)) + 
  theme_void()
