#Create master CSV dataset from historic pathobiology Access database
  #The original FRP database holds sample collection data for all samples (fish, invertebrates, mammals, plankton, environmental) 
  #collected by the Pathobiology group from 1978 through 2014, only excluding sample sets from the BCSIndexSite project and 
  #the BCS_JuneauMortality project. 

#Author: Erin Fedewa
#Last update: 7/26/22 

library(RODBC)
library(tidyverse)

#Import "All Collections" table only from access database 
db1 <- "./Data/FRP_Database_ReadOnly.accdb"
con1 <- odbcConnectAccess2007(db1)
sqlTables(con1)$TABLE_NAME
BCS <- sqlFetch(con1, "tbl_ALL_New_Collection_Results")

#Filter for majid, cancrid and lithodid species and write csv 
BCS %>% 
  filter(Category5_decapods == c("cancrids","majids","lithodids" )) %>%
  #Cleaning up columns we won't need
  select(-Category1, -Category2, -Category3, -Category4, -Category5_decapods, 
         -Collected_By, -Most_Recent_ID_By, -Random, -Haul_Comments) %>%
  #Pulling out collections that don't have sampling protocol/lat&long etc. 
  filter(!LME %in% c(3,70,90,99,110,NA)) %>%
  write.csv(file="./data/BCS Master Data.csv", row.names = FALSE)

