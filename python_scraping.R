site <- 'https://edu.hellobi.com/course/explore?page=1'

web <- read_html(site)

store <- web %>% html_nodes('div.mt30 div.caption h3')
store
people <- web %>% html_nodes('div.mt30 div.caption span.length')
people


install.packages("rvest")
library("rvest")
library("openxlsx")

url <- 'https://climate.weather.gc.ca/climate_data/daily_data_e.html?hlyRange=2012-05-07%7C2020-10-18&dlyRange=2012-05-10%7C2020-10-18&mlyRange=%7C&StationID=50269&Prov=BC&urlExtension=_e.html&searchType=stnName&optLimit=yearRange&StartYear=1840&EndYear=2020&selRowPerPage=25&Line=2&searchMethod=contains&txtStationName=penticton&timeframe=2&Day=12&Year=2020&Month=10#'
website <- read_html(url, encoding = 'urf-8')

html_node(website, 'tr')

try <- website1 %>% html_nodes('div.temperature ng-star-inserted')
try


weatherweb <- 'https://weather.gc.ca/city/pages/bc-84_metric_e.html'
website1 <- read_html(weatherweb)


weatherdata <- website1 %>% html_nodes('p.text-center mrgn-tp-md mrgn-bttm-sm lead hidden-xs')
weatherdata

current <- try1[1] %>% html_text()
current

elevendays_forcast <- website1 %>% html_nodes("ul.list-inline span.wxo-metric-hide") %>% html_text()
elevendays_forcast

now <- 'https://weather.gc.ca/city/pages/bc-84_metric_e.html'
readnow <- read_html(now)

temp <- readnow %>% html_nodes('dd.mrgn-bttm-0 wxo-metric-hide')
temp

calender <- 'https://www.wunderground.com/calendar/ca/penticton/CYYF/date/2020-10'
readcal <-read_html(calender)

temp <- readcal %>% html_nodes('span.wu-value wu-value-to')
tem