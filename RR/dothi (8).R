df <- read.csv("https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_daily_reports_us/03-01-2021.csv")
data <- df %>% select(Province_State,Confirmed,Deaths,Recovered)
data$Recovered[is.na(data$Recovered)] <- 0

library(reshape2)
df1 <- melt(data, id = "Province_State")
library(ggplot2)
ggplot(data=df1, aes(x=Province_State, y=value, fill=variable))+
  geom_bar(stat="identity", position=position_dodge()) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
