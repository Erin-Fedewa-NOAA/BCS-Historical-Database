# notes ----
#Data exploration: Spatiotemporal footprint of BCS data collection efforts by 
  #AFSC pathobiology program (pre-2014 development of Bering Sea index sites)

# Author: Erin Fedewa
# last updated: 2022/7/24

# load ----
library(tidyverse)
library(sf)
library(ggmap)
library(gganimate)

# Data 
BCSdat <- read.csv("./data/BCS Master Data.csv")

#####################################################
#Data exploration of full dataset 

nrow(BCSdat) # 19,045 samples!!
range(pull(BCSdat, Year)) #Some data back to 1978
distinct(BCSdat, Species_Name)
distinct(BCSdat, LME) #1=Bering Sea, 2=GOA, 54=NBS/Chukchi, 55=Beaufort, 
#65=Aleutians, 80=Atlantic Coast/Newfoundland (see metadata)

#Sample size by species and LME
BCSdat %>%
  group_by(Species_Name, LME) %>%
  count() %>%
  print(n=100) #Primarily bairdi, opilio and RKC from Bering and GOA

#Sample sizes for PCR/Smear reads by LME
BCSdat %>%
  filter((SMEAR_result %in% 0:1 | BCS_PCR_results %in% 0:1)) %>%
  group_by(Year, LME) %>%
  count() %>%
  print(n=100) #1978-1987 data include only histology, not BCS diagnosis 

##################################
#GOA/SEAK data exploration

#Sample # of PCR and smear reads by year/species 
BCSdat %>%
  filter(LME==2,
         SMEAR_result %in% 0:1) %>%
  count(Year, Species_Name, name = "smear_0_1") %>%
  full_join(BCSdat %>%
  filter(LME==2,
         BCS_PCR_results %in% 0:1) %>%
  count(Year, Species_Name, name = "pcr_0_1")) %>%
  arrange(Year, Species_Name)
#Mostly bairdi, started PCR in 2003 

#Spatial coverage of bairdi sampling 
  #Spatial maps of diagnosis 
BCSdat %>%
  filter(LME == 2,
         Species_Name == "Chionoecetes bairdi",
         !is.na(Latitude), !is.na(Longitude)) %>% 
  mutate(Diagnosis = ifelse(SMEAR_result==0 |BCS_PCR_results==0, "BCS_Neg",
                            ifelse(SMEAR_result==1 |BCS_PCR_results==1, "BCS_Pos",NA)))%>%
           filter(!(is.na(Diagnosis))) -> plot

#Only if using geom_sf to map
#dat <- st_as_sf(test, coords = c("Latitude", "Longitude"))
#ph_basemap <- get_map(location=c(-163,54,-134,59), source = 'osm')

  #Basemaps
usa <- raster::getData("GADM", country = c("USA"), level = 1, path = "./data")
can <- raster::getData("GADM", country = c("CAN"), level = 1, path = "./data")

#GOA/SEAK Tanner spatial prevalence across all years 
plot %>%
  ggplot() + 
    geom_polygon(data = usa, aes(x = long, y = lat, group = group))+
    geom_point(aes(x = Longitude, y = Latitude, fill=Diagnosis, color=Diagnosis))+
    coord_quickmap(xlim = c(-168, -132), ylim = c(53, 60.5)) +
    scale_colour_manual(values = c("grey","red")) +
    theme_bw() +
    #animate by year
    transition_states(as.factor(Year), wrap=FALSE) +
    labs(x = "Longitude", y = "Latitude", title = "{closest_state}") 
     
anim_save("./output/GOA_BCSprev_timeseries.gif")
#could also transition through years and facet by LME with bering and gulf!
#try size=N in geom point 

####################################
#Read in Sean shape files and use geom_sf + geom_point 

EBSgrid_layer <- readOGR(dsn=survey_gdb,layer="EBS_grid")
BBsurveystrata_layer <- readOGR(dsn=survey_gdb,layer="BristolBaySurveyStrata")
Pribsurveystrata_layer <- readOGR(dsn=survey_gdb,layer="PribilofIslandSurveyStrata")
StMattsurveystrata_layer <- readOGR(dsn=survey_gdb,layer="StMatthewSurveyStrata")
NBSgrid_layer <- readOGR(dsn=survey_gdb,layer="NBS_grid")
NortonSound <- readOGR(dsn=survey_gdb,layer="NortonSound44")

#Bering Sea sample sizes by species and year
BCSdat %>%
  filter(LME == 1) %>% 
  group_by(Year, LME, Species_Name) %>% 
  count() %>%
  print(n=170) %>%
  ggplot(aes(fill=Species_Name, y=n, x=Year)) +
  geom_bar(position="stack", stat="identity")

#BCS diagnosis (+/-/NA) in Bering Sea by year
BCSdat %>%
  filter(LME == 1) %>% 
  mutate(Diagnosis = ifelse(SMEAR_result==0 |BCS_PCR_results==0, "BCS_Neg",
                              ifelse(SMEAR_result==1 |BCS_PCR_results==1, "BCS_Pos",NA)))%>%
  group_by(Year) %>%
  ggplot(aes(x=Year, group=Diagnosis, fill=Diagnosis)) +
    geom_histogram(position="stack", binwidth = .5) #Lots of NA's! 
  
#Spatial maps of diagnosis 
BCSdat %>%
  filter(LME == 1,
         !is.na(Latitude), !is.na(Longitude)) %>% 
  mutate(Diagnosis = ifelse(SMEAR_result==0 |BCS_PCR_results==0, "BCS_Neg",
                            ifelse(SMEAR_result==1 |BCS_PCR_results==1, "BCS_Pos",NA))) ->test

dat <- st_as_sf(test, coords = c("Latitude", "Longitude"))

  ggplot(dat, aes(geometry=geometry)) + 
  theme_bw() +
  geom_sf(aes(fill = Diagnosis), colour = "dark grey") + 
  scale_x_continuous(name = "Longitude") +
  scale_y_continuous(name = "Latitude") +
  labs(fill = "Diagnosis") +
  facet_wrap(~Year)
  



#Smear vrs PCR data


#Spatial footprint of GOA
  #Write up metadata/protocols for data collection 
  
  library(dataspice)
create_spice(dir="./")












