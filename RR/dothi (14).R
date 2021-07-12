library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
#Load Data
url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-01-2021.csv"
df <- read.csv(url, header = TRUE)
#Nhom du lieu
country <- df %>% group_by(Country_Region)
country <- country %>% summarise(Recovered=sum(Recovered),
                                 Confirmed=sum(Confirmed),
                                 Deaths=sum(Deaths))
#Sort
country <- country[order(-country$Confirmed),]
country<-country[-c(1,2,3,4,7,11),]
country<-country<-country[1:10,]

data <- country
fig <- plot_ly(data, x = ~Confirmed, y = ~Recovered)
fig <- fig %>% add_trace(x = ~Confirmed, y = ~Recovered, text = ~Country_Region, type = 'scatter', color='red', name='dots')
fig <- fig %>% add_trace(type = 'scatter', mode='text',text = ~Country_Region, name='text')
fig <- fig %>% layout(title = 'Recovered - Comfirmed by Country (Scatter Plot)',
                      xaxis = list(showgrid = TRUE),
                      yaxis = list(showgrid = TRUE))
fig