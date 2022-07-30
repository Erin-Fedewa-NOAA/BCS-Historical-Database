# BCS-Historical-Database

Historic bitter crab syndrome monitoring dataset  { "@context": "http://schema.org", "type": "Dataset", "name": "Historic bitter crab syndrome monitoring dataset", "creator": \[ { "type": "Person", "id": null, "email": "erin.fedewa@noaa.gov", "affiliation": "NOAA-AFSC", "name": "Erin Fedewa" }, { "type": "Person", "id": null, "email": null, "affiliation": "NOAA-AFSC (retired)", "name": "Pam Jensen" } \], "description": "This dataset contains sample collection data for all majid, cancrid and lithodid decapods collected by the NOAA AFSC Pathobiology group from 1978 to 2013", "datePublished": "7/25/2022", "keywords": \["bitter crab syndrome", "Bering Sea", "Gulf of Alaska", "tanner crab", "snow crab", "red king crab"\], "funder": null, "temporalCoverage": "1978-06-01/2013-10-01", "license": null, "spatialCoverage": { "type": "Place", "name": "LME's: Bering Sea, GOA, Arctic, Beaufort Sea, Aleutian Islands, Atlantic Coast/Newfoundland", "geo": { "type": "GeoShape", "box": "72.0025 -132.8532 51.59767 -179.9203" } }, "variableMeasured": \[ { "type": "PropertyValue", "unitText": "ID Code", "name": "SPNO", "description": "Unique specimen ID. First four numbers correspond to year of collection" }, { "type": "PropertyValue", "unitText": "text", "name": "Species\_Name", "description": "Decapod species sampled" }, { "type": "PropertyValue", "unitText": "numeric", "name": "Sex", "description": "0=NA, 1=Male, 2=Female, 3=Unknown, 4=Hermaphrodite, 5=Transitional, 6=indeterminant" }, { "type": "PropertyValue", "unitText": "millimeter", "name": "Size", "description": "Carapace length (lithodid) or carapace width (Chioneocetes)" }, { "type": "PropertyValue", "unitText": "millimeter", "name": "Chela", "description": "Height at widest point of right chela: males only" }, { "type": "PropertyValue", "unitText": "numeric", "name": "Shell\_Condition", "description": "0=premolt/molting, 1=softshell, 2=newshell, 3=oldshell, 4=very oldshell, 5=graveyard, 9=unk" }, { "type": "PropertyValue", "unitText": "millimeter", "name": "Clutch", "description": "Female egg color, egg condition and clutch size information. See \\"Clutch\_Codes.csv\\" for numeric codes" }, { "type": "PropertyValue", "unitText": "text", "name": "Collection\_Comments", "description": "General comments about specimen/nature of collection" }, { "type": "PropertyValue", "unitText": "numeric", "name": "BODYID", "description": "Body location of visual anomaly. See \\"Histology\_Codes.csv\\" for numeric codes" }, { "type": "PropertyValue", "unitText": "numeric", "name": "VISUAL", "description": "Visual anamoly. See \\"Histology\_Codes.csv\\" for numeric codes" }, { "type": "PropertyValue", "unitText": "numeric", "name": "DISTID", "description": "Distibution of physical anomaly. See \\"Histology\_Codes.csv\\" for numeric codes" }, { "type": "PropertyValue", "unitText": "numeric", "name": "Year", "description": "Year of specimen collection" }, { "type": "PropertyValue", "unitText": "MM/DD/YYYYHH::MM", "name": "Date", "description": "Date of specimen collection" }, { "type": "PropertyValue", "unitText": "numeric", "name": "HISTO\_result", "description": "Etiology results for organ/tissue/cell examined: See \\"Histology\_Codes.csv\\" for numeric codes" }, { "type": "PropertyValue", "unitText": "numeric", "name": "SMEAR\_result", "description": "Results from visual inspection of hemolymph smear preparations stained with Geimsa and read with a compound microscope for BCS diagnosis. Numeric results of 0 = BCS negative, 1 = BCS positive, 3=Undetermined, 4=Unreadable slide, 8=slide missing, 7777=no result-smear was made, 9999=no smear made for sample" }, { "type": "PropertyValue", "unitText": "numeric", "name": "T\_Rating", "description": "T\_Rating field has more detail about the cells on the slide for BCS positive samples including Hematodinium stage (T = trophont, P = prespore, D = dinospore) and relative amount of that cell type ranging from 1-5 (1 = up to 10% of cells viewed and 5 = over 90% of cells viewed). T\_Rating is not available for samples collected prior to 1999" }, { "type": "PropertyValue", "unitText": "numeric", "name": "BCS\_PCR\_results", "description": "PCR Assay results for BCS diagnosis. Numeric results of 0=BCS negative, 1=BCS positive, 3=inconclusive (ie disagreement at loci, extra band), 4=results pending, 7777=No result-DNA preserved, 9999=No DNA preserved for this sample" }, { "type": "PropertyValue", "unitText": "numeric", "name": "Specific\_Location", "description": "Specific location of sample collection within LME. See \\"Location\_Codes.csv\\" for numeric codes" }, { "type": "PropertyValue", "unitText": "numeric", "name": "General\_Location", "description": "General location of sample collection corresponding with LME. See \\"Location\_Codes.csv\\" for numeric codes" }, { "type": "PropertyValue", "unitText": null, "name": "ReferenceNO", "description": null }, { "type": "PropertyValue", "unitText": "numeric", "name": "C\_V\_H", "description": "The concatenation of the Cruise, Vessel and Haul for the collection location. For some records that do not have a cruise/vessel/haul, a combination of 0\_0\_SPNO is used instead to ensure a unique value is used for location data" }, { "type": "PropertyValue", "unitText": "numeric", "name": "Cruise", "description": "Cruise ID for Bering Sea/GOA/Atlantic bottom trawl surveys. See RACEBASE or AKFIN for additional NOAA cruise metadata" }, { "type": "PropertyValue", "unitText": "numeric", "name": "Vessel", "description": "ID number of the vessel used to collect data for that haul associated with vessel name. See \\"Vessel\_Codes.csv\\" for numeric codes" }, { "type": "PropertyValue", "unitText": "numeric", "name": "Haul", "description": "Uniquely identifies a sampling event (haul) within an AFSC cruise. It is a sequential number, in chronological order of occurrence." }, { "type": "PropertyValue", "unitText": "numeric/text", "name": "StationID", "description": "Alpha-numeric designation for the station established in the design of AFSC standardized surveys." }, { "type": "PropertyValue", "unitText": "numeric", "name": "Stratum", "description": "RACE database statistical area for analyzing data. Strata were designed using bathymetry and other geographic and habitat-related elements. See AKFIN for a complete list of stratum descriptions" }, { "type": "PropertyValue", "unitText": "numeric", "name": "LME", "description": "Large marine ecosystem of collection: 1=Bering Sea/Slope, 2=GOA/SEAK, 54=NE Arctic/Chukchi Sea, 55=Beaufort Sea, 65=Aleutian Islands, 80=Atlantic Coast/Newfoundland" }, { "type": "PropertyValue", "unitText": "numeric", "name": "Bering\_Sea\_Regions", "description": null }, { "type": "PropertyValue", "unitText": "MM/DD/YYYYHH::MM", "name": "Haul\_Date", "description": "The date (MM/DD/YYYY) and time (HH:MM) of the beginning of the haul." }, { "type": "PropertyValue", "unitText": "decimalDegree", "name": "Latitude", "description": "Latitude of specimen collection. Designates latitude at start of haul for AFSC standardized surveys" }, { "type": "PropertyValue", "unitText": "decimalDegree", "name": "Longitude", "description": "Longitude of specimen collection. Designates longititude at start of haul for AFSC standardized surveys" }, { "type": "PropertyValue", "unitText": "meters", "name": "Depth", "description": "Bottom depth" }, { "type": "PropertyValue", "unitText": "numeric", "name": "Bottom\_Type", "description": "Substrate type recorded during survey: See AFSC Groundfish Survey Codes Bottom Type Code Supplementary Table (Pg 40)" }, { "type": "PropertyValue", "unitText": "Degree C", "name": "Bottom\_Temp", "description": "Bottom temperature (tenths of a degree Celsius); NA indicates removed or missing values." }, { "type": "PropertyValue", "unitText": "Degree C", "name": "Surface\_Temp", "description": "Surface temperature (tenths of a degree Celsius); NA indicates removed or missing values." } \], "distribution": \[ { "type": "DataDownload", "name": "Historic bitter crab syndrome monitoring data", "contentUrl": "https://github.com/Erin-Fedewa-NOAA", "encodingFormat": "csv" } \] } body { font-size: 16px; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"; margin: 0 auto; padding: 1rem; max-width: 800px; } #map { height: 20rem; } #attributes-wrapper, #jsonld-wrapper { height: 20rem; overflow-y: scroll; } table { border-collapse: collapse; } th { border-bottom: 1px solid black; } th, td { padding: 0.25rem; } table.listing td { border: 1px solid #CCC; } table.listing tr td:first-child { background-color: #EEE; } table.listing ul { margin: 0 0 0 1.5rem; padding: 0; }

Historic bitter crab syndrome monitoring dataset
================================================

**Description:** This dataset contains sample collection data for all majid, cancrid and lithodid decapods collected by the NOAA AFSC Pathobiology group from 1978 to 2013

Bibliographic
-------------

Published

7/25/2022

Keywords

*   bitter crab syndrome
*   Bering Sea
*   Gulf of Alaska
*   tanner crab
*   snow crab
*   red king crab

Funder

License

Coverage
--------

### Temporal

Begin

1978-06-01

End

2013-10-01

### Spatial

Attributes
----------

Name

Description

Unit

`SPNO`

Unique specimen ID. First four numbers correspond to year of collection

ID Code

`Species_Name`

Decapod species sampled

text

`Sex`

0=NA, 1=Male, 2=Female, 3=Unknown, 4=Hermaphrodite, 5=Transitional, 6=indeterminant

numeric

`Size`

Carapace length (lithodid) or carapace width (Chioneocetes)

millimeter

`Chela`

Height at widest point of right chela: males only

millimeter

`Shell_Condition`

0=premolt/molting, 1=softshell, 2=newshell, 3=oldshell, 4=very oldshell, 5=graveyard, 9=unk

numeric

`Clutch`

Female egg color, egg condition and clutch size information. See "Clutch\_Codes.csv" for numeric codes

millimeter

`Collection_Comments`

General comments about specimen/nature of collection

text

`BODYID`

Body location of visual anomaly. See "Histology\_Codes.csv" for numeric codes

numeric

`VISUAL`

Visual anamoly. See "Histology\_Codes.csv" for numeric codes

numeric

`DISTID`

Distibution of physical anomaly. See "Histology\_Codes.csv" for numeric codes

numeric

`Year`

Year of specimen collection

numeric

`Date`

Date of specimen collection

MM/DD/YYYYHH::MM

`HISTO_result`

Etiology results for organ/tissue/cell examined: See "Histology\_Codes.csv" for numeric codes

numeric

`SMEAR_result`

Results from visual inspection of hemolymph smear preparations stained with Geimsa and read with a compound microscope for BCS diagnosis. Numeric results of 0 = BCS negative, 1 = BCS positive, 3=Undetermined, 4=Unreadable slide, 8=slide missing, 7777=no result-smear was made, 9999=no smear made for sample

numeric

`T_Rating`

T\_Rating field has more detail about the cells on the slide for BCS positive samples including Hematodinium stage (T = trophont, P = prespore, D = dinospore) and relative amount of that cell type ranging from 1-5 (1 = up to 10% of cells viewed and 5 = over 90% of cells viewed). T\_Rating is not available for samples collected prior to 1999

numeric

`BCS_PCR_results`

PCR Assay results for BCS diagnosis. Numeric results of 0=BCS negative, 1=BCS positive, 3=inconclusive (ie disagreement at loci, extra band), 4=results pending, 7777=No result-DNA preserved, 9999=No DNA preserved for this sample

numeric

`Specific_Location`

Specific location of sample collection within LME. See "Location\_Codes.csv" for numeric codes

numeric

`General_Location`

General location of sample collection corresponding with LME. See "Location\_Codes.csv" for numeric codes

numeric

`ReferenceNO`

This dataset contains sample collection data for all majid, cancrid and lithodid decapods collected by the NOAA AFSC Pathobiology group from 1978 to 2013

`C_V_H`

The concatenation of the Cruise, Vessel and Haul for the collection location. For some records that do not have a cruise/vessel/haul, a combination of 0\_0\_SPNO is used instead to ensure a unique value is used for location data

numeric

`Cruise`

Cruise ID for Bering Sea/GOA/Atlantic bottom trawl surveys. See RACEBASE or AKFIN for additional NOAA cruise metadata

numeric

`Vessel`

ID number of the vessel used to collect data for that haul associated with vessel name. See "Vessel\_Codes.csv" for numeric codes

numeric

`Haul`

Uniquely identifies a sampling event (haul) within an AFSC cruise. It is a sequential number, in chronological order of occurrence.

numeric

`StationID`

Alpha-numeric designation for the station established in the design of AFSC standardized surveys.

numeric/text

`Stratum`

RACE database statistical area for analyzing data. Strata were designed using bathymetry and other geographic and habitat-related elements. See AKFIN for a complete list of stratum descriptions

numeric

`LME`

Large marine ecosystem of collection: 1=Bering Sea/Slope, 2=GOA/SEAK, 54=NE Arctic/Chukchi Sea, 55=Beaufort Sea, 65=Aleutian Islands, 80=Atlantic Coast/Newfoundland

numeric

`Bering_Sea_Regions`

This dataset contains sample collection data for all majid, cancrid and lithodid decapods collected by the NOAA AFSC Pathobiology group from 1978 to 2013

numeric

`Haul_Date`

The date (MM/DD/YYYY) and time (HH:MM) of the beginning of the haul.

MM/DD/YYYYHH::MM

`Latitude`

Latitude of specimen collection. Designates latitude at start of haul for AFSC standardized surveys

decimalDegree

`Longitude`

Longitude of specimen collection. Designates longititude at start of haul for AFSC standardized surveys

decimalDegree

`Depth`

Bottom depth

meters

`Bottom_Type`

Substrate type recorded during survey: See AFSC Groundfish Survey Codes Bottom Type Code Supplementary Table (Pg 40)

numeric

`Bottom_Temp`

Bottom temperature (tenths of a degree Celsius); NA indicates removed or missing values.

Degree C

`Surface_Temp`

Surface temperature (tenths of a degree Celsius); NA indicates removed or missing values.

Degree C

Distribution
------------

File

Format

 

`Historic bitter crab syndrome monitoring data`

`csv`

[Download](https://github.com/Erin-Fedewa-NOAA)

 var mymap = L.map('map').setView(\[61.800085, -156.38675\], 1); L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', { attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>', maxZoom: 18, }).addTo(mymap); var polygon = L.polygon(\[\[ 72.0025, -132.8532\], \[ 51.59767, -132.8532\], \[ 51.59767, -179.9203\], \[ 72.0025, -179.9203\]\]).addTo(mymap);
