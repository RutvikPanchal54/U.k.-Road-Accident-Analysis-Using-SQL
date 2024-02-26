CREATE DATABASE UK_PROJECT;
USE UK_PROJECT; 

CREATE TABLE Accidents_2015 (
    Accident_Index VARCHAR(13) NOT NULL,
    Location_Easting_OSGR DECIMAL(38, 0),
    Location_Northing_OSGR DECIMAL(38, 0),
    Longitude DECIMAL(38, 6),
    Latitude DECIMAL(38, 6),
    Police_Force DECIMAL(38, 0) NOT NULL,
    Accident_Severity DECIMAL(38, 0) NOT NULL,
    Number_of_Vehicles DECIMAL(38, 0) NOT NULL,
    Number_of_Casualties DECIMAL(38, 0) NOT NULL,
    Date VARCHAR(10) NOT NULL,
    Day_of_Week DECIMAL(38, 0) NOT NULL,
    Time TIME, -- Change DATETIME to TIME
    Local_Authority_District DECIMAL(38, 0) NOT NULL,
    Local_Authority_Highway VARCHAR(9) NOT NULL,
    1st_Road_Class DECIMAL(38, 0) NOT NULL,
    1st_Road_Number DECIMAL(38, 0) NOT NULL,
    Road_Type DECIMAL(38, 0) NOT NULL,
    Speed_limit DECIMAL(38, 0) NOT NULL,
    Junction_Detail DECIMAL(38, 0) NOT NULL,
    Junction_Control DECIMAL(38, 0) NOT NULL,
    2nd_Road_Class DECIMAL(38, 0) NOT NULL,
    2nd_Road_Number DECIMAL(38, 0) NOT NULL,
    Pedestrian_Crossing_Human_Control DECIMAL(38, 0) NOT NULL,
    Pedestrian_Crossing_Physical_Facilities DECIMAL(38, 0) NOT NULL,
    Light_Conditions DECIMAL(38, 0) NOT NULL,
    Weather_Conditions DECIMAL(38, 0) NOT NULL,
    Road_Surface_Conditions DECIMAL(38, 0) NOT NULL,
    Special_Conditions_at_Site DECIMAL(38, 0) NOT NULL,
    Carriageway_Hazards DECIMAL(38, 0) NOT NULL,
    Urban_or_Rural_Area DECIMAL(38, 0) NOT NULL,
    Did_Police_Officer_Attend_Scene_of_Accident DECIMAL(38, 0) NOT NULL,
    LSOA_of_Accident_Location VARCHAR(9)
);


-- Adjust timeout settings if needed
SET GLOBAL wait_timeout = 600;
SET GLOBAL interactive_timeout = 600;

-- Adjust max_allowed_packet if needed
SET GLOBAL max_allowed_packet = 128M;

-- Adjust local_infile if needed
SET GLOBAL local_infile = 1;

LOAD DATA INFILE 'E:/UK/Accidents_2015.csv'
INTO TABLE Accidents_2015
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    @Accident_Index,
    @Location_Easting_OSGR,
    @Location_Northing_OSGR,
    @Longitude,
    @Latitude,
    @Police_Force,
    @Accident_Severity,
    @Number_of_Vehicles,
    @Number_of_Casualties,
    @Date,
    @Day_of_Week,
    @Time,
    @Local_Authority_District,
    @Local_Authority_Highway,
    @1st_Road_Class,
    @1st_Road_Number,
    @Road_Type,
    @Speed_limit,
    @Junction_Detail,
    @Junction_Control,
    @2nd_Road_Class,
    @2nd_Road_Number,
    @Pedestrian_Crossing_Human_Control,
    @Pedestrian_Crossing_Physical_Facilities,
    @Light_Conditions,
    @Weather_Conditions,
    @Road_Surface_Conditions,
    @Special_Conditions_at_Site,
    @Carriageway_Hazards,
    @Urban_or_Rural_Area,
    @Did_Police_Officer_Attend_Scene_of_Accident,
    @LSOA_of_Accident_Location
)
SET
    Accident_Index = NULLIF(@Accident_Index, ''),
    Location_Easting_OSGR = NULLIF(@Location_Easting_OSGR, ''),
    Location_Northing_OSGR = NULLIF(@Location_Northing_OSGR, ''),
    Longitude = NULLIF(@Longitude, ''),
    Latitude = NULLIF(@Latitude, ''),
    Police_Force = NULLIF(@Police_Force, ''),
    Accident_Severity = NULLIF(@Accident_Severity, ''),
    Number_of_Vehicles = NULLIF(@Number_of_Vehicles, ''),
    Number_of_Casualties = NULLIF(@Number_of_Casualties, ''),
    Date = NULLIF(@Date, ''),
    Day_of_Week = NULLIF(@Day_of_Week, ''),
    Time = NULLIF(@Time, ''),
    Local_Authority_District = NULLIF(@Local_Authority_District, ''),
    Local_Authority_Highway = NULLIF(@Local_Authority_Highway, ''),
    1st_Road_Class = NULLIF(@1st_Road_Class, ''),
    1st_Road_Number = NULLIF(@1st_Road_Number, ''),
    Road_Type = NULLIF(@Road_Type, ''),
    Speed_limit = NULLIF(@Speed_limit, ''),
    Junction_Detail = NULLIF(@Junction_Detail, ''),
    Junction_Control = NULLIF(@Junction_Control, ''),
    2nd_Road_Class = NULLIF(@2nd_Road_Class, ''),
    2nd_Road_Number = NULLIF(@2nd_Road_Number, ''),
    Pedestrian_Crossing_Human_Control = NULLIF(@Pedestrian_Crossing_Human_Control, ''),
    Pedestrian_Crossing_Physical_Facilities = NULLIF(@Pedestrian_Crossing_Physical_Facilities, ''),
    Light_Conditions = NULLIF(@Light_Conditions, ''),
    Weather_Conditions = NULLIF(@Weather_Conditions, ''),
    Road_Surface_Conditions = NULLIF(@Road_Surface_Conditions, ''),
    Special_Conditions_at_Site = NULLIF(@Special_Conditions_at_Site, ''),
    Carriageway_Hazards = NULLIF(@Carriageway_Hazards, ''),
    Urban_or_Rural_Area = NULLIF(@Urban_or_Rural_Area, ''),
    Did_Police_Officer_Attend_Scene_of_Accident = NULLIF(@Did_Police_Officer_Attend_Scene_of_Accident, ''),
    LSOA_of_Accident_Location = NULLIF(@LSOA_of_Accident_Location, '');


CREATE TABLE vehicle_types (
	code DECIMAL(38, 0) NOT NULL, 
	label VARCHAR(37) NOT NULL
);

LOAD DATA INFILE 'E:/UK/vehicle_types.csv'
INTO TABLE vehicle_types
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Vehicles_2015 (
	Accident_Index VARCHAR(13) NOT NULL, 
	Vehicle_Reference DECIMAL(38, 0) NOT NULL, 
	Vehicle_Type DECIMAL(38, 0) NOT NULL, 
	Towing_and_Articulation DECIMAL(38, 0) NOT NULL, 
	Vehicle_Manoeuvre DECIMAL(38, 0) NOT NULL, 
	Vehicle_Location_Restricted_Lane DECIMAL(38, 0) NOT NULL, 
	Junction_Location DECIMAL(38, 0) NOT NULL, 
	Skidding_and_Overturning DECIMAL(38, 0) NOT NULL, 
	Hit_Object_in_Carriageway DECIMAL(38, 0) NOT NULL, 
	Vehicle_Leaving_Carriageway DECIMAL(38, 0) NOT NULL, 
	Hit_Object_off_Carriageway DECIMAL(38, 0) NOT NULL, 
	1st_Point_of_Impact DECIMAL(38, 0) NOT NULL, 
	`Was_Vehicle_Left_Hand_Drive_?` DECIMAL(38, 0) NOT NULL, 
	Journey_Purpose_of_Driver DECIMAL(38, 0) NOT NULL, 
	Sex_of_Driver DECIMAL(38, 0) NOT NULL, 
	Age_of_Driver DECIMAL(38, 0) NOT NULL, 
	Age_Band_of_Driver DECIMAL(38, 0) NOT NULL, 
	Engine_Capacity_CC DECIMAL(38, 0) NOT NULL, 
	Propulsion_Code DECIMAL(38, 0) NOT NULL, 
	Age_of_Vehicle DECIMAL(38, 0) NOT NULL, 
	Driver_IMD_Decile DECIMAL(38, 0) NOT NULL, 
	Driver_Home_Area_Type DECIMAL(38, 0) NOT NULL, 
	Vehicle_IMD_Decile DECIMAL(38, 0) NOT NULL
);

-- Adjust timeout settings if needed
SET GLOBAL wait_timeout = 600;
SET GLOBAL interactive_timeout = 600;

-- Adjust max_allowed_packet if needed
SET GLOBAL max_allowed_packet = 128*1024*1024;

-- Adjust local_infile if needed
SET GLOBAL local_infile = 1;

LOAD DATA INFILE 'E:/UK/Vehicles_2015.csv'
INTO TABLE Vehicles_2015
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    @Accident_Index,
    @Vehicle_Reference,
    @Vehicle_Type,
    @Towing_and_Articulation,
    @Vehicle_Manoeuvre,
    @Vehicle_Location_Restricted_Lane,
    @Junction_Location,
    @Skidding_and_Overturning,
    @Hit_Object_in_Carriageway,
    @Vehicle_Leaving_Carriageway,
    @Hit_Object_off_Carriageway,
    @1st_Point_of_Impact,
    @`Was_Vehicle_Left_Hand_Drive_?`,
    @Journey_Purpose_of_Driver,
    @Sex_of_Driver,
    @Age_of_Driver,
    @Age_Band_of_Driver,
    @Engine_Capacity_CC,
    @Propulsion_Code,
    @Age_of_Vehicle,
    @Driver_IMD_Decile,
    @Driver_Home_Area_Type,
    @Vehicle_IMD_Decile
)
SET
    Accident_Index = NULLIF(@Accident_Index, ''),
    Vehicle_Reference = NULLIF(@Vehicle_Reference, ''),
    Vehicle_Type = NULLIF(@Vehicle_Type, ''),
    Towing_and_Articulation = NULLIF(@Towing_and_Articulation, ''),
    Vehicle_Manoeuvre = NULLIF(@Vehicle_Manoeuvre, ''),
    Vehicle_Location_Restricted_Lane = NULLIF(@Vehicle_Location_Restricted_Lane, ''),
    Junction_Location = NULLIF(@Junction_Location, ''),
    Skidding_and_Overturning = NULLIF(@Skidding_and_Overturning, ''),
    Hit_Object_in_Carriageway = NULLIF(@Hit_Object_in_Carriageway, ''),
    Vehicle_Leaving_Carriageway = NULLIF(@Vehicle_Leaving_Carriageway, ''),
    Hit_Object_off_Carriageway = NULLIF(@Hit_Object_off_Carriageway, ''),
    1st_Point_of_Impact = NULLIF(@1st_Point_of_Impact, ''),
    Journey_Purpose_of_Driver = NULLIF(@Journey_Purpose_of_Driver, ''),
    Sex_of_Driver = NULLIF(@Sex_of_Driver, ''),
    Age_of_Driver = NULLIF(@Age_of_Driver, ''),
    Age_Band_of_Driver = NULLIF(@Age_Band_of_Driver, ''),
    Engine_Capacity_CC = NULLIF(@Engine_Capacity_CC, ''),
    Propulsion_Code = NULLIF(@Propulsion_Code, ''),
    Age_of_Vehicle = NULLIF(@Age_of_Vehicle, ''),
    Driver_IMD_Decile = NULLIF(@Driver_IMD_Decile, ''),
    Driver_Home_Area_Type = NULLIF(@Driver_Home_Area_Type, ''),
    Vehicle_IMD_Decile = NULLIF(@Vehicle_IMD_Decile, '');

/* Buisness Problem :
The UK Department of Transport provides open datasets on road safety and casualties, and one can
use these datasets to analyze how safe the roads in the UK are. This project will help you answer a
few questions using their 2015 dataset.
The dataset has 3 tables i.e Accident, vehicle, Vehicle_type */ 

/* 1. Evaluate the median severity value of accidents caused by various Motorcycles. */ 

SELECT DISTINCT vt.label AS Motorcycle_Type
FROM Vehicles_2015 v
JOIN vehicle_types vt ON v.Vehicle_Type = vt.code
WHERE vt.label LIKE 'Motorcycle%';

SELECT DISTINCT Accident_Severity
FROM Accidents_2015;

/* SELECT vt.label AS Vehicle_Type, SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(a.Accident_Severity 
ORDER BY a.Accident_Severity), ',', 50/100), ',', -1) AS Median_Severity
FROM Accidents_2015 a
JOIN Vehicles_2015 v ON a.Accident_Index = v.Accident_Index
JOIN vehicle_types vt ON v.Vehicle_Type = vt.code
WHERE vt.label LIKE 'Motorcycle%'
GROUP BY vt.label;*/

SELECT vt.label AS Vehicle_Type,
AVG(a.Accident_Severity) AS Median_Severity
FROM Accidents_2015 a
JOIN Vehicles_2015 v ON a.Accident_Index = v.Accident_Index
JOIN vehicle_types vt ON v.Vehicle_Type = vt.code
WHERE vt.label LIKE 'Motorcycle%'
GROUP BY vt.label;

SET SESSION group_concat_max_len = 9000000;

SELECT vt.label AS Vehicle_Type, IFNULL(SUBSTRING_INDEX(SUBSTRING_INDEX
(GROUP_CONCAT(a.Accident_Severity ORDER BY a.Accident_Severity), ',',
COUNT(*) / 2 + 1), ',', -1), 'No Data') AS Median_Severity 
FROM vehicle_types vt 
JOIN Vehicles_2015 v ON vt.code = v.Vehicle_Type 
JOIN Accidents_2015 a ON v.Accident_Index = a.Accident_Index 
WHERE vt.label LIKE 'Motorcycle%'
GROUP BY vt.label;


/* 2. Evaluate Accident Severity and Total Accidents per Vehicle Type */

SELECT vt.label AS Vehicle_Type, COUNT(*) AS Total_Accidents,
AVG(a.Accident_Severity) AS Average_Severity
FROM Accidents_2015 a
JOIN Vehicles_2015 v ON a.Accident_Index = v.Accident_Index
JOIN vehicle_types vt ON v.Vehicle_Type = vt.code
GROUP BY vt.label
ORDER BY Total_Accidents DESC;

/* 3. Calculate the Average Severity by vehicle type. */

SELECT vt.label AS Vehicle_Type,
AVG(a.Accident_Severity) AS Average_Severity
FROM Accidents_2015 a
JOIN Vehicles_2015 v ON a.Accident_Index = v.Accident_Index
JOIN vehicle_types vt ON v.Vehicle_Type = vt.code
GROUP BY vt.label;

/* 4. Calculate the Average Severity and Total Accidents by Motorcycle. */

SELECT vt.label AS Vehicle_Type, COUNT(*) AS Total_Accidents,
AVG(a.Accident_Severity) AS Average_Severity
FROM Accidents_2015 a
JOIN Vehicles_2015 v ON a.Accident_Index = v.Accident_Index
JOIN vehicle_types vt ON v.Vehicle_Type = vt.code
WHERE vt.label LIKE 'Motorcycle%'
GROUP BY vt.label;
    
/* Total Clasualties*/    
SELECT
    SUM(Number_of_Casualties) AS Total_Casualties,
    SUM(CASE WHEN Accident_Severity = 1 THEN Number_of_Casualties ELSE 0 END) AS Fatalities,
    SUM(CASE WHEN Accident_Severity = 2 THEN Number_of_Casualties ELSE 0 END) AS Seriously_Injured,
    SUM(CASE WHEN Accident_Severity = 3 THEN Number_of_Casualties ELSE 0 END) AS Slightly_Injured
FROM Accidents_2015;

/* Calculate fatalities and total casualties by region for the year 2015 */
SELECT
    Local_Authority_District,
    SUM(CASE WHEN Accident_Severity = 1 THEN Number_of_Casualties ELSE 0 END) AS Fatalities,
    SUM(Number_of_Casualties) AS Total_Casualties,
    (SUM(CASE WHEN Accident_Severity = 1 
    THEN Number_of_Casualties ELSE 0 END) / SUM(Number_of_Casualties)) * 100 AS Percentage_Fatalities
FROM Accidents_2015
GROUP BY Local_Authority_District
ORDER BY Percentage_Fatalities DESC;



