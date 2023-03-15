-- First step was to upload 8 CSV files into BigQuery as 8 different tables

-- Creat one single table using UNIONALL(), separate the column Region into two columns
-- and remove spaces between the Price column

SELECT*,
Substr(Region,1,Instr(Region,",")) AS region,
Substr(Region,Instr(Region,",")) AS country,
REGEXP_REPLACE(Price," ","") as Price_euros
FROM `sound-dream-362117.John_Taylor_French_Riviera.Real_Estate_Data_1`
UNION ALL
SELECT*,
Substr(Region,1,Instr(Region,",")) AS region ,
Substr(Region,Instr(Region,",")) AS country,
REGEXP_REPLACE(Price," ","") as Price_euros
FROM `sound-dream-362117.John_Taylor_French_Riviera.Real_Estate_Data_2`
UNION ALL
SELECT*,
Substr(Region,1,Instr(Region,",")) AS region ,
Substr(Region,Instr(Region,",")) AS country,
REGEXP_REPLACE(Price," ","") as Price_euros
FROM `sound-dream-362117.John_Taylor_French_Riviera.Real_Estate_Data_3`
UNION ALL
SELECT*,
Substr(Region,1,Instr(Region,",")) AS region ,
Substr(Region,Instr(Region,",")) AS country,
 REGEXP_REPLACE(Price," ","") as Price_euros
FROM `sound-dream-362117.John_Taylor_French_Riviera.Real_Estate_Data_4`
UNION ALL
SELECT*,
Substr(Region,1,Instr(Region,",")) AS region ,
Substr(Region,Instr(Region,",")) AS country,
 REGEXP_REPLACE(Price," ","") as Price_euros
FROM `sound-dream-362117.John_Taylor_French_Riviera.Real_Estate_Data_5`
UNION ALL
SELECT*,
Substr(Region,1,Instr(Region,",")) AS region ,
Substr(Region,Instr(Region,",")) AS country,
 REGEXP_REPLACE(Price," ","") as Price_euros
FROM `sound-dream-362117.John_Taylor_French_Riviera.Real_Estate_Data_6`
UNION ALL
SELECT*,
Substr(Region,1,Instr(Region,",")) AS region ,
Substr(Region,Instr(Region,",")) AS country,
 REGEXP_REPLACE(Price," ","") as Price_euros
FROM `sound-dream-362117.John_Taylor_French_Riviera.Real_Estate_Data_7`
UNION ALL
SELECT*,
Substr(Region,1,Instr(Region,",")) AS region ,
Substr(Region,Instr(Region,",")) AS country,
 REGEXP_REPLACE(Price," ","") as Price_euros
FROM `sound-dream-362117.John_Taylor_French_Riviera.Real_Estate_Data_8`

-- Trim the comma from the region and country columns, cast the Price_euros 
-- column as Numeric

SELECT *,
RTrim(region_1,',') AS Region,
LTrim(country,',') AS Country,
CAST (price_euros as NUMERIC) AS Price_Num
FROM `sound-dream-362117.John_Taylor_French_Riviera.French_Riviera_Data`;

-- Select the columns I want to remain in the table and save it. Alternatively, 
-- I could have used the ALTER DROP() function to just remove any unwanted tables.

SELECT
 Date,
 Listing_Id,
 Town, 
 Region_2 AS Region, 
 Country_1 AS Country, Price_Num AS Price, 
 Description_1, Description_2, Description_3, Description_4
FROM `sound-dream-362117.John_Taylor_French_Riviera.French_Riviera_Data_Cleaned`