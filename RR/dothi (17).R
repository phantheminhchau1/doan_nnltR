df <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-30-2021.csv")
df <-df[!(df1$Country_Region != "Vietnam"),]
ggplot(data = df,col="#AA4371",
       aes(x = reorder(Province_State, Confirmed), y = Confirmed))+
  geom_bar(stat = "identity",fill="steelblue")+
  coord_flip()
