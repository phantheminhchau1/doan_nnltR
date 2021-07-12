jhu_url <- paste("https://raw.githubusercontent.com/CSSEGISandData/", 
                 "COVID-19/master/csse_covid_19_data/", "csse_covid_19_time_series/", 
                 "time_series_19-covid-Confirmed.csv", sep = "")

us_confirmed_long_jhu <- read_csv(jhu_url) %>% rename(province = "Province/State", country_region = "Country/Region") %>% pivot_longer(-c(province, country_region, Lat, Long), names_to = "Date", values_to = "cumulative_cases") %>% 
  # adjust JHU dates back one day to reflect US time, more or
  # less
  mutate(Date = mdy(Date) - days(1)) %>% filter(country_region == 
                                                  "US") %>% arrange(province, Date) %>% group_by(province) %>% 
  mutate(incident_cases = c(0, diff(cumulative_cases))) %>% 
  ungroup() %>% select(-c(country_region, Lat, Long, cumulative_cases)) %>% 
  filter(str_detect(province, "Diamond Princess", negate = TRUE))

