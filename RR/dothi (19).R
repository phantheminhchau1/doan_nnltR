library(tidyverse)
library(lubridate)
library(ggplot2)
library(plotly)
theme_set(theme_minimal())
#ConfirmDataset
confirm_url<-'https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv'
confirm <- read_csv(confirm_url)
confirm <- confirm %>%
  pivot_longer(-c(`Province/State`, `Country/Region`, Lat, Long),
               names_to = "date",
               values_to = "confirmed_n"
  ) %>%
  select(-c(Lat, Long)) %>%
  rename(
    province_state = "Province/State",
    country_region = "Country/Region"
  ) %>%
  mutate(date = mdy(date)) %>%
  group_by(country_region, date) %>%
  summarise(confirmed_n = sum(confirmed_n)) %>%
  ungroup()

confirm <- confirm %>%
  arrange(date) %>%
  group_by(country_region) %>%
  ungroup()
global <- confirm[c('country_region','date','confirmed_n')]

#DeathsDataset
death_url<-'https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv'
death<-read_csv(death_url)
death <- death %>%
  pivot_longer(-c(`Province/State`, `Country/Region`, Lat, Long),
               names_to = "date",
               values_to = "deaths_n"
  ) %>%
  select(-c(Lat, Long)) %>%
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`
  ) %>%
  mutate(date = mdy(date)) %>%
  group_by(country_region, date) %>%
  summarise(deaths_n = sum(deaths_n)) %>%
  ungroup()

death <- death %>%
  arrange(date) %>%
  group_by(country_region) %>%  ungroup()
death <-death[c('deaths_n')]
global <- cbind(global,death)

#Recovered
recover_url<-'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv'
recover<-read_csv(recover_url)
recover <- recover %>%
  pivot_longer(-c(`Province/State`, `Country/Region`, Lat, Long),
               names_to = "date",
               values_to = "recovered_n"
  ) %>%
  select(-c(Lat, Long)) %>%
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`
  ) %>%
  mutate(date = mdy(date)) %>%
  group_by(country_region, date) %>%
  summarise(recovered_n = sum(recovered_n)) %>%
  ungroup()

recover <- recover %>%
  arrange(date) %>%
  group_by(country_region) %>%  ungroup()
recover <-recover[c('recovered_n')]
global <- cbind(global,recover)

#Fig
fig <- plot_ly(global, x=~date)
fig <- fig %>% add_trace(y=~confirmed_n,
                         name='Confirmed', type='scatter', mode='lines')
fig <- fig %>% add_lines(y=~recovered_n,
                         name= 'Recovered')
fig <- fig %>% add_lines(y=~deaths_n,
                         name='Deaths')

fig <- fig %>% layout(
  title = "Wordwide Timeseries",
  xaxis = list( rangeslider = list(type = "date")),
  yaxis = list(title = "cases"))

fig