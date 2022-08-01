# notes ----
#Data exploration: Spatiotemporal footprint of BCS data collection efforts by 
  #AFSC pathobiology program (1978-2013)

# Author: Erin Fedewa
# last updated: 2022/8/1

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
#Mostly C. bairdi, started PCR in 2003 

#Plot sample sizes 
BCSdat %>%
  filter(LME == 2,
         SMEAR_result %in% 0:1 | BCS_PCR_results %in% 0:1) %>% 
  group_by(Year, LME, Species_Name) %>% 
  count() %>%
  print(n=170) %>%
  ggplot(aes(fill=Species_Name, y=n, x=Year)) +
  geom_bar(position="stack", stat="identity") +
  theme_bw()
ggsave("./output/GOA_species_n_timeseries.png")

#Spatial coverage of C. bairdi sampling 

#Basemaps
usa <- raster::getData("GADM", country = c("USA"), level = 1, path = "./data")
can <- raster::getData("GADM", country = c("CAN"), level = 1, path = "./data")
  
#C. bairdi sample size by year plot
BCSdat %>% 
  filter(LME == 2,
         Species_Name == "Chionoecetes bairdi",
         !is.na(Latitude), !is.na(Longitude),
         SMEAR_result %in% 0:1 | BCS_PCR_results %in% 0:1) %>%
  group_by(Year, Latitude, Longitude) %>%
  summarise(Sample_size=n()) %>%
  ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group))+
  geom_point(aes(x = Longitude, y = Latitude, size=Sample_size), color= "light blue")+
  coord_quickmap(xlim = c(-168, -132), ylim = c(53, 60.5)) +
  theme_bw() +
  facet_wrap(~Year)
ggsave("./output/GOA_bairdi_n_timeseries.png")
  
#C. bairdi BCS diagnosis by year plot 
BCSdat %>%
  filter(LME == 2,
         Species_Name == "Chionoecetes bairdi",
         !is.na(Latitude), !is.na(Longitude)) %>% 
  mutate(Diagnosis = ifelse(SMEAR_result==0 |BCS_PCR_results==0, "BCS_Neg",
                            ifelse(SMEAR_result==1 |BCS_PCR_results==1, "BCS_Pos",NA)))%>%
  filter(!(is.na(Diagnosis))) -> plot

#Faceted by year  
plot %>%
  ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group))+
  geom_point(aes(x = Longitude, y = Latitude, fill=Diagnosis, color=Diagnosis))+
  coord_quickmap(xlim = c(-168, -132), ylim = c(53, 60.5)) +
  scale_colour_manual(values = c("grey","red")) +
  theme_bw() +
  facet_wrap(~Year)
ggsave("./output/GOA_bairdi_BCSprev_timeseries.png")
  
#Gif by year
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
anim_save("./output/GOA_bairdi_BCSprev_gif.gif")

####################################
#Bering Sea data exploration

#Sample # of PCR and smear reads by year/species 
BCSdat %>%
  filter(LME==1,
         SMEAR_result %in% 0:1) %>%
  count(Year, Species_Name, name = "smear_0_1") %>%
  full_join(BCSdat %>%
              filter(LME==1,
                     BCS_PCR_results %in% 0:1) %>%
              count(Year, Species_Name, name = "pcr_0_1")) %>%
  arrange(Year, Species_Name) 
#Mostly C. bairdi/opilio, started PCR in 2003

#Plot sample sizes 
BCSdat %>%
  filter(LME == 1,
         SMEAR_result %in% 0:1 | BCS_PCR_results %in% 0:1) %>% 
  group_by(Year, LME, Species_Name) %>% 
  count() %>%
  print(n=170) %>%
  ggplot(aes(fill=Species_Name, y=n, x=Year)) +
    geom_bar(position="stack", stat="identity") +
  theme_bw()
ggsave("./output/BS_species_n_timeseries.png")

#BCS diagnosis (+/-/NA) in Bering Sea by year
BCSdat %>%
  filter(LME == 1) %>% 
  mutate(Diagnosis = ifelse(SMEAR_result==0 |BCS_PCR_results==0, "BCS_Neg",
                            ifelse(SMEAR_result==1 |BCS_PCR_results==1, "BCS_Pos",NA)))%>%
  group_by(Year) %>%
  ggplot(aes(x=Year, group=Diagnosis, fill=Diagnosis)) +
  geom_histogram(position="stack", binwidth = .5) +
  theme_bw() #Lots of NA's! 

#Spatial coverage of C. bairdi/opilio sampling 

#Basemaps
usa <- raster::getData("GADM", country = c("USA"), level = 1, path = "./data")
can <- raster::getData("GADM", country = c("CAN"), level = 1, path = "./data")

#######

#C. bairdi sample size by year plot
BCSdat %>% 
  filter(LME == 1,
         Species_Name == "Chionoecetes bairdi",
         !is.na(Latitude), !is.na(Longitude),
         SMEAR_result %in% 0:1 | BCS_PCR_results %in% 0:1) %>%
  group_by(Year, Latitude, Longitude) %>%
  summarise(Sample_size=n()) %>%
  ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group))+
  geom_point(aes(x = Longitude, y = Latitude, size=Sample_size), color= "light blue")+
  coord_quickmap(xlim = c(-179, -158), ylim = c(53, 64)) +
  theme_bw() +
  facet_wrap(~Year)
ggsave("./output/EBS_bairdi_n_timeseries.png")

#C. bairdi BCS diagnosis by year plot 
BCSdat %>%
  filter(LME == 1,
         Species_Name == "Chionoecetes bairdi",
         !is.na(Latitude), !is.na(Longitude)) %>% 
  mutate(Diagnosis = ifelse(SMEAR_result==0 |BCS_PCR_results==0, "BCS_Neg",
                            ifelse(SMEAR_result==1 |BCS_PCR_results==1, "BCS_Pos",NA)))%>%
  filter(!(is.na(Diagnosis))) -> plot

#Faceted by year  
plot %>%
  ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group))+
  geom_point(aes(x = Longitude, y = Latitude, fill=Diagnosis, color=Diagnosis))+
  coord_quickmap(xlim = c(-179, -158), ylim = c(53, 64)) +
  scale_colour_manual(values = c("grey","red")) +
  theme_bw() +
  facet_wrap(~Year)
ggsave("./output/EBS_bairdi_BCSprev_timeseries.png")

#######

#C. opilio sample size by year plot
BCSdat %>% 
  filter(LME == 1,
         Species_Name == "Chionoecetes opilio",
         !is.na(Latitude), !is.na(Longitude),
         SMEAR_result %in% 0:1 | BCS_PCR_results %in% 0:1) %>%
  group_by(Year, Latitude, Longitude) %>%
  summarise(Sample_size=n()) %>%
  ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group))+
  geom_point(aes(x = Longitude, y = Latitude, size=Sample_size), color= "light blue")+
  coord_quickmap(xlim = c(-179, -158), ylim = c(53, 64)) +
  theme_bw() +
  facet_wrap(~Year)
ggsave("./output/EBS_opilio_n_timeseries.png")


#C. opilio BCS diagnosis by year plot 
BCSdat %>%
  filter(LME == 1,
         Species_Name == "Chionoecetes opilio",
         !is.na(Latitude), !is.na(Longitude)) %>% 
  mutate(Diagnosis = ifelse(SMEAR_result==0 |BCS_PCR_results==0, "BCS_Neg",
                            ifelse(SMEAR_result==1 |BCS_PCR_results==1, "BCS_Pos",NA)))%>%
  filter(!(is.na(Diagnosis))) -> plot

#Faceted by year  
plot %>%
  ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group))+
  geom_point(aes(x = Longitude, y = Latitude, fill=Diagnosis, color=Diagnosis))+
  coord_quickmap(xlim = c(-179, -158), ylim = c(53, 64)) +
  scale_colour_manual(values = c("grey","red")) +
  theme_bw() +
  facet_wrap(~Year)
ggsave("./output/EBS_opilio_BCSprev_timeseries.png")

####################################
#NBS/Chukchi/Beaufort data exploration

#Sample # of PCR and smear reads by year/species 
BCSdat %>%
  filter(LME %in% 54:55,
         SMEAR_result %in% 0:1) %>%
  count(Year, Species_Name, name = "smear_0_1") %>%
  full_join(BCSdat %>%
              filter(LME %in% 54:55,
                     BCS_PCR_results %in% 0:1) %>%
              count(Year, Species_Name, name = "pcr_0_1")) %>%
  arrange(Year, Species_Name) 
#C. opilio and Hyas, started PCR in 2005

#Plot sample sizes 
BCSdat %>%
  filter(LME %in% 54:55,
         SMEAR_result %in% 0:1 | BCS_PCR_results %in% 0:1) %>% 
  group_by(Year, LME, Species_Name) %>% 
  count() %>%
  print(n=170) %>%
  ggplot(aes(fill=Species_Name, y=n, x=Year)) +
  geom_bar(position="stack", stat="identity") +
  theme_bw()
ggsave("./output/Arctic_species_n_timeseries.png")

#C. opilio sample size by year plot
BCSdat %>% 
  filter(LME %in% 54:55,
         Species_Name == "Chionoecetes opilio",
         !is.na(Latitude), !is.na(Longitude),
         SMEAR_result %in% 0:1 | BCS_PCR_results %in% 0:1) %>%
  group_by(Year, Latitude, Longitude) %>%
  summarise(Sample_size=n()) %>%
  ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group))+
  geom_point(aes(x = Longitude, y = Latitude, size=Sample_size), color= "light blue")+
  coord_quickmap(xlim = c(-177, -153), ylim = c(61, 73)) +
  theme_bw() +
  facet_wrap(~Year)
ggsave("./output/Arctic_opilio_n_timeseries.png")


#C. opilio BCS diagnosis by year plot 
BCSdat %>%
  filter(LME %in% 54:55,
         Species_Name == "Chionoecetes opilio",
         !is.na(Latitude), !is.na(Longitude)) %>% 
  mutate(Diagnosis = ifelse(SMEAR_result==0 |BCS_PCR_results==0, "BCS_Neg",
                            ifelse(SMEAR_result==1 |BCS_PCR_results==1, "BCS_Pos",NA)))%>%
  filter(!(is.na(Diagnosis))) -> plot

#Faceted by year  
plot %>%
  ggplot() + 
  geom_polygon(data = usa, aes(x = long, y = lat, group = group))+
  geom_point(aes(x = Longitude, y = Latitude, fill=Diagnosis, color=Diagnosis))+
  coord_quickmap(xlim = c(-177, -153), ylim = c(61, 73)) +
  scale_colour_manual(values = c("grey","red")) +
  theme_bw() +
  facet_wrap(~Year)
ggsave("./output/Arctic_opilio_BCSprev_timeseries.png")





















  

  
















