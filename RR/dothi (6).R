df <- read.csv("https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_daily_reports_us/03-01-2021.csv")
ggplot(data = df,col="#AA4371",
       aes(x = reorder(Province_State, Confirmed), y = Confirmed))+
  geom_bar(stat = "identity",fill="steelblue")+
  coord_flip()
