df1 <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-30-2021.csv")
df1 <-df1[!(df1$Country_Region != "Vietnam"),]
df2 <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-01-2021.csv")
df2 <-df2[!(df2$Country_Region != "Vietnam"),]
df3 <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-02-2021.csv")
df3 <-df3[!(df3$Country_Region != "Vietnam"),]
df4 <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-03-2021.csv")
df4 <-df4[!(df4$Country_Region != "Vietnam"),]
df5 <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-04-2021.csv")
df5 <-df5[!(df5$Country_Region != "Vietnam"),]
df6 <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-05-2021.csv")
df6 <-df6[!(df6$Country_Region != "Vietnam"),]
df7 <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-06-2021.csv")
df7 <-df7[!(df7$Country_Region != "Vietnam"),]
df8 <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-07-2021.csv")
df8 <-df8[!(df8$Country_Region != "Vietnam"),]
df9 <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-08-2021.csv")
df9 <-df9[!(df9$Country_Region != "Vietnam"),]
df10 <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-09-2021.csv")
df10 <-df10[!(df10$Country_Region != "Vietnam"),]

df <- dplyr::bind_rows(df1,df2, df3, df4, df5, df6, df7, df8, df9, df10)

df["Last_Update"] <- c(1,2,3,4,5,6,7,8,9,10)
library(ggplot2)
library(lubridate)
theme_set(theme_bw())

# plot
ggplot(df, aes(x=Last_Update)) + 
  geom_line(aes(y=Confirmed, col="Confirmed")) + 
  geom_line(aes(y=Recovered, col="Recovered"))
