library(readr)
library(lubridate)
library(magrittr)
library(dplyr)

input <- read_csv("london_meters.csv")
plot(input$time, input$kWh)
input %<>% mutate(wday = wday(time, label = TRUE))

m <- lm(kWh ~ wday, input)
summary(m)
plot(input$wday, fitted(m))

input %<>% mutate(hour = as.factor(hour(time)))
m <- lm(kWh ~ wday + hour, input)
with(input, plot(time, residuals(m)))
