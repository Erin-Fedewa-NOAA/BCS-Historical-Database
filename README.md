# BCS-Historical-Database

Historic bitter crab syndrome monitoring dataset
================================================

file:///C:/Users/erin.fedewa/Work/Ongoing%20Research/Pathobiology/BCS%20Monitoring%20Data/BCS%20Historical%20Database/docs/index.html

**Description:** This dataset contains sample collection data for all
majid, cancrid and lithodid decapods collected by the NOAA AFSC
Pathobiology group from 1978 to 2013. Data includes results from histology, blood smears and PCR for disease diagnosis and staging 

Bibliographic
-------------


| Published                         | 7/25/2022                         |
|----------------------------------+------------------------------------|
| Keywords                          | -   bitter crab syndrome          |
|                                   | -   Bering Sea                    |
|                                   | -   Gulf of Alaska                |
|                                   | -   tanner crab                   |
|                                   | -   snow crab                     |
|                                   | -   red king crab                 |


Coverage
--------

### Temporal

  ------- ------------
  Begin   1978-06-01
  End     2013-10-01
  ------- ------------

### Spatial

::: {#map}
:::

Attributes
----------

:::   Name                    Description                                              Unit
  ----------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------
  `SPNO`                  Unique specimen ID. First four numbers correspond to year of collection                                                                                                                                                                                                                                                                                  ID Code
  `Species_Name`          Decapod species sampled                                                                                                                                                                                                                                                                                                                                  text
  `Sex`                   0=NA, 1=Male, 2=Female, 3=Unknown, 4=Hermaphrodite, 5=Transitional, 6=indeterminant                                                                                                                                                                                                                                                                      numeric
  `Size`                  Carapace length (lithodid) or carapace width (Chioneocetes)                                                                                                                                                                                                                                                                                              millimeter
  `Chela`                 Height at widest point of right chela: males only                                                                                                                                                                                                                                                                                                        millimeter
  `Shell_Condition`       0=premolt/molting, 1=softshell, 2=newshell, 3=oldshell, 4=very oldshell, 5=graveyard, 9=unk                                                                                                                                                                                                                                                              numeric
  `Clutch`                Female egg color, egg condition and clutch size information. See \"Clutch\_Codes.csv\" for numeric codes                                                                                                                                                                                                                                                 millimeter
  `Collection_Comments`   General comments about specimen/nature of collection                                                                                                                                                                                                                                                                                                     text
  `BODYID`                Body location of visual anomaly. See \"Histology\_Codes.csv\" for numeric codes                                                                                                                                                                                                                                                                          numeric
  `VISUAL`                Visual anamoly. See \"Histology\_Codes.csv\" for numeric codes                                                                                                                                                                                                                                                                                           numeric
  `DISTID`                Distibution of physical anomaly. See \"Histology\_Codes.csv\" for numeric codes                                                                                                                                                                                                                                                                          numeric
  `Year`                  Year of specimen collection                                                                                                                                                                                                                                                                                                                              numeric
  `Date`                  Date of specimen collection                                                                                                                                                                                                                                                                                                                              MM/DD/YYYYHH::MM
  `HISTO_result`          Etiology results for organ/tissue/cell examined: See \"Histology\_Codes.csv\" for numeric codes                                                                                                                                                                                                                                                          numeric
  `SMEAR_result`          Results from visual inspection of hemolymph smear preparations stained with Geimsa and read with a compound microscope for BCS diagnosis. Numeric results of 0 = BCS negative, 1 = BCS positive, 3=Undetermined, 4=Unreadable slide, 8=slide missing, 7777=no result-smear was made, 9999=no smear made for sample                                       numeric
  `T_Rating`              T\_Rating field has more detail about the cells on the slide for BCS positive samples including Hematodinium stage (T = trophont, P = prespore, D = dinospore) and relative amount of that cell type ranging from 1-5 (1 = up to 10% of cells viewed and 5 = over 90% of cells viewed). T\_Rating is not available for samples collected prior to 1999   numeric
  `BCS_PCR_results`       PCR Assay results for BCS diagnosis. Numeric results of 0=BCS negative, 1=BCS positive, 3=inconclusive (ie disagreement at loci, extra band), 4=results pending, 7777=No result-DNA preserved, 9999=No DNA preserved for this sample                                                                                                                     numeric
  `Specific_Location`     Specific location of sample collection within LME. See \"Location\_Codes.csv\" for numeric codes                                                                                                                                                                                                                                                         numeric
  `General_Location`      General location of sample collection corresponding with LME. See \"Location\_Codes.csv\" for numeric codes                                                                                                                                                                                                                                              numeric
  `ReferenceNO`           This dataset contains sample collection data for all majid, cancrid and lithodid decapods collected by the NOAA AFSC Pathobiology group from 1978 to 2013                                                                                                                                                                                                
  `C_V_H`                 The concatenation of the Cruise, Vessel and Haul for the collection location. For some records that do not have a cruise/vessel/haul, a combination of 0\_0\_SPNO is used instead to ensure a unique value is used for location data                                                                                                                     numeric
  `Cruise`                Cruise ID for Bering Sea/GOA/Atlantic bottom trawl surveys. See RACEBASE or AKFIN for additional NOAA cruise metadata                                                                                                                                                                                                                                    numeric
  `Vessel`                ID number of the vessel used to collect data for that haul associated with vessel name. See \"Vessel\_Codes.csv\" for numeric codes                                                                                                                                                                                                                      numeric
  `Haul`                  Uniquely identifies a sampling event (haul) within an AFSC cruise. It is a sequential number, in chronological order of occurrence.                                                                                                                                                                                                                      numeric
  `StationID`             Alpha-numeric designation for the station established in the design of AFSC standardized surveys.                                                                                                                                                                                                                                                        numeric/text
  `Stratum`               RACE database statistical area for analyzing data. Strata were designed using bathymetry and other geographic and habitat-related elements. See AKFIN for a complete list of stratum descriptions                                                                                                                                                        numeric
  `LME`                   Large marine ecosystem of collection: 1=Bering Sea/Slope, 2=GOA/SEAK, 54=NE Arctic/Chukchi Sea, 55=Beaufort Sea, 65=Aleutian Islands, 80=Atlantic Coast/Newfoundland                                                                                                                                                                                     numeric
  `Bering_Sea_Regions`    This dataset contains sample collection data for all majid, cancrid and lithodid decapods collected by the NOAA AFSC Pathobiology group from 1978 to 2013                                                                                                                                                                                                numeric
  `Haul_Date`             The date (MM/DD/YYYY) and time (HH:MM) of the beginning of the haul.                                                                                                                                                                                                                                                                                     MM/DD/YYYYHH::MM
  `Latitude`              Latitude of specimen collection. Designates latitude at start of haul for AFSC standardized surveys                                                                                                                                                                                                                                                      decimalDegree
  `Longitude`             Longitude of specimen collection. Designates longititude at start of haul for AFSC standardized surveys                                                                                                                                                                                                                                                  decimalDegree
  `Depth`                 Bottom depth                                                                                                                                                                                                                                                                                                                                             meters
  `Bottom_Type`           Substrate type recorded during survey: See AFSC Groundfish Survey Codes Bottom Type Code Supplementary Table (Pg 40)                                                                                                                                                                                                                                     numeric
  `Bottom_Temp`           Bottom temperature (tenths of a degree Celsius); NA indicates removed or missing values.                                                                                                                                                                                                                                                                 Degree C
  `Surface_Temp`          Surface temperature (tenths of a degree Celsius); NA indicates removed or missing values.                                                                                                                                                                                                                                                                Degree C
:::

Distribution
------------

  File                                              Format    
  ------------------------------------------------- -------- -------------------------------------------------
  `Historic bitter crab syndrome monitoring data`   `csv`    [Download](https://github.com/Erin-Fedewa-NOAA)
