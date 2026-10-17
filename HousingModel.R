setwd("/Users/thomassheldon/Desktop")
library(tidyverse)
library(cansim)
install.packages("dynamac")
library(dynamac)
install.packages("forecast")
library(forecast)
library(tseries)
install.packages("TSstudio")
library(TSstudio)
install.packages("urca")
library(urca)
install.packages("ARDL")
library(ARDL)

# retrieve data
housingprice <- get_cansim("18-10-0205-01") #this is an index, with dec 2016 == 100 - since it's an index we'd have to do rate of change

housingstarts <- get_cansim("34-10-0158-01") 

mortgagerates <- get_cansim("34-10-0145-01")

residentialbuildingcost <- get_cansim("18-10-0289-01") # this is quarterly and only starts in 2017

population <- get_cansim("17-10-0009-01") # this is quarterly
#we're leaving population out to start


#clean
#note building cost are quarterly
housingprice <- housingprice %>% select(Date, `GEO`,`New housing price indexes`, VALUE) %>% filter(`GEO` == "Canada", `New housing price indexes` == "House only") %>% rename(price = VALUE)

housingstarts <- housingstarts %>% select(Date, `GEO`, val_norm) %>% filter(`GEO` == "Canada") %>% rename(starts = val_norm)

mortgagerates <- mortgagerates %>% select(Date, `GEO`, VALUE) %>% rename(rates = VALUE)

residentialbuildingcost <- residentialbuildingcost %>% select(Date, `GEO`, VALUE, `Type of building`) %>% filter(`Type of building` == "Residential buildings")

#join (exclude residential building costs and population for now)
housingdata <- list(housingstarts, housingprice, mortgagerates) %>% reduce(left_join, by = "Date") %>% select(Date, starts, rates, price)










