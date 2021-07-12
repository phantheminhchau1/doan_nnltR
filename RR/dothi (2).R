df <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-07-2021.csv")
library(ggplot2)

# Create Data
data <- data.frame(
  group=c("Confirmed","Deaths","Recovered"),
  value=c(sum(df$Confirmed),sum(df$Deaths),sum(df$Recovered,na.rm = T))
)

# Basic piechart
ggplot(data, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)
