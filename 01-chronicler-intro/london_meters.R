library(readr)
library(lubridate)
library(magrittr)
library(dplyr)

input <- read_csv("london_meters.csv")
input # print on the console

plot(input$time, input$kWh)

m <- lm(kWh ~ wday(time) + hour(time), input)
summary(m)

input %<>% mutate(value = kWh/sd(kWh))
m <- lm(value ~ wday(time) + hour(time), input)
