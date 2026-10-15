setwd("/Users/thomassheldon/Desktop")
library(tidyverse)
library(cansim)

# retrieve data
housingprice <- get_cansim("18-10-0205-01")

housingstarts <- get_cansim("34-10-0158-01")

mortgagerates <- get_cansim("34-10-0145-01")

residentialbuildingcost <- get_cansim("18-10-0289-01") # this is quarterly
 
population <- get_cansim("17-10-0009-01") # this is quarterly

buildingpermits <- get_cansim("34-10-0292-01")

constructioninvestment <- get_cansim("34-10-0293-01")


