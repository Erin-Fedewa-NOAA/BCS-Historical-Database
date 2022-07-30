#Create metadata files for BCS Master CSV

#Author: Erin Fedewa
#Metadata created on 7/25/22

library(dataspice)
library(tidyverse)

# Data 
BCSdat <- read.csv("./data/BCS Master Data.csv")

######################################

#Create metadata folder and files 
create_spice(dir="./")

#Data creator details 
edit_creators()

#Access details: where data can be accessed 
prep_access()
edit_access()

#Biblio details: metadata (title, spatiotemporal coverage)
range(BCSdat$Year) 

BCSdat %>%
  filter(LME != 80) -> akonly 
range(akonly$Longitude, na.rm=T)
range(akonly$Latitude, na.rm=T)

range(BCSdat$Date, na.rm=T) 
unique(BCSdat$LME)

edit_biblio()

#Attribute details: details about the variables in the dataset
prep_attributes()
edit_attributes()

#Variables
str(BCSdat)

#Create metadata file 
write_spice()

jsonlite::read_json(here::here("data", "metadata", "dataspice.json")) %>% 
  listviewer::jsonedit()

#BuildReadMe Site 
build_site()
