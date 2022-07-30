# BCS-Historical-Database

Historic bitter crab syndrome monitoring dataset { "@context":
"http://schema.org", "type": "Dataset", "name": "Historic bitter crab
syndrome monitoring dataset", "creator": \\\[ { "type": "Person", "id":
null, "email": "erin.fedewa@noaa.gov", "affiliation": "NOAA-AFSC",
"name": "Erin Fedewa" }, { "type": "Person", "id": null, "email": null,
"affiliation": "NOAA-AFSC (retired)", "name": "Pam Jensen" } \\\],
"description": "This dataset contains sample collection data for all
majid, cancrid and lithodid decapods collected by the NOAA AFSC
Pathobiology group from 1978 to 2013", "datePublished": "7/25/2022",
"keywords": \\\["bitter crab syndrome", "Bering Sea", "Gulf of Alaska",
"tanner crab", "snow crab", "red king crab"\\\], "funder": null,
"temporalCoverage": "1978-06-01/2013-10-01", "license": null,
"spatialCoverage": { "type": "Place", "name": "LME's: Bering Sea, GOA,
Arctic, Beaufort Sea, Aleutian Islands, Atlantic Coast/Newfoundland",
"geo": { "type": "GeoShape", "box": "72.0025 -132.8532 51.59767
-179.9203" } }, "variableMeasured": \\\[ { "type": "PropertyValue",
"unitText": "ID Code", "name": "SPNO", "description": "Unique specimen
ID. First four numbers correspond to year of collection" }, { "type":
"PropertyValue", "unitText": "text", "name": "Species\\\_Name",
"description": "Decapod species sampled" }, { "type": "PropertyValue",
"unitText": "numeric", "name": "Sex", "description": "0=NA, 1=Male,
2=Female, 3=Unknown, 4=Hermaphrodite, 5=Transitional, 6=indeterminant"
}, { "type": "PropertyValue", "unitText": "millimeter", "name": "Size",
"description": "Carapace length (lithodid) or carapace width
(Chioneocetes)" }, { "type": "PropertyValue", "unitText": "millimeter",
"name": "Chela", "description": "Height at widest point of right chela:
males only" }, { "type": "PropertyValue", "unitText": "numeric", "name":
"Shell\\\_Condition", "description": "0=premolt/molting, 1=softshell,
2=newshell, 3=oldshell, 4=very oldshell, 5=graveyard, 9=unk" }, {
"type": "PropertyValue", "unitText": "millimeter", "name": "Clutch",
"description": "Female egg color, egg condition and clutch size
information. See \\\\"Clutch\\\_Codes.csv\\\\" for numeric codes" }, {
"type": "PropertyValue", "unitText": "text", "name":
"Collection\\\_Comments", "description": "General comments about
specimen/nature of collection" }, { "type": "PropertyValue", "unitText":
"numeric", "name": "BODYID", "description": "Body location of visual
anomaly. See \\\\"Histology\\\_Codes.csv\\\\" for numeric codes" }, {
"type": "PropertyValue", "unitText": "numeric", "name": "VISUAL",
"description": "Visual anamoly. See \\\\"Histology\\\_Codes.csv\\\\" for
numeric codes" }, { "type": "PropertyValue", "unitText": "numeric",
"name": "DISTID", "description": "Distibution of physical anomaly. See
\\\\"Histology\\\_Codes.csv\\\\" for numeric codes" }, { "type":
"PropertyValue", "unitText": "numeric", "name": "Year", "description":
"Year of specimen collection" }, { "type": "PropertyValue", "unitText":
"MM/DD/YYYYHH::MM", "name": "Date
