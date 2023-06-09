-- Databricks notebook source
/*Total no of Male and Female NASA Astronauts,1959-present in America*/

SELECT
    Gender,
    COUNT(*) AS Total
FROM
    astronaut_data
WHERE
    Year >= 1959   
GROUP BY
    Gender;


-- COMMAND ----------

/* Number of astronauts from each state */

SELECT
    State,
    COUNT(*) AS Total
FROM
    astronaut_data
GROUP BY
    State
ORDER BY
    Total DESC;


-- COMMAND ----------

/* count of astronauts served in the each military branch */

SELECT Military_Branch, COUNT(*) AS Total
FROM astronaut_data
GROUP BY Military_Branch;


-- COMMAND ----------

/* Number of deaths occurred for each mission */

SELECT death_mission, COUNT(*) AS num_deaths
FROM astronaut_data
WHERE death_mission IS NOT NULL
GROUP BY death_mission;


-- COMMAND ----------

/* The number of flights for each mission and total no of space walks by astronauts */

SELECT Missions AS Mission,
COUNT(DISTINCT Name) AS Total_Flights,
SUM(Space_Walks) AS Total_Space_Walks 
FROM astronaut_data
GROUP BY Mission

-- COMMAND ----------

/* Number of astronauts took the same major */

SELECT Undergraduate_Major, 
COUNT(*) AS Total
FROM astronaut_data 
WHERE Undergraduate_Major IS NOT NULL 
GROUP BY Undergraduate_Major 
HAVING COUNT(*) > 1 
ORDER BY Total DESC;


-- COMMAND ----------

/* Status of the astronauts who are Active, Retired, Deceased, Management */

SELECT Status, COUNT(*) AS Total
FROM astronaut_data
GROUP BY Status


-- COMMAND ----------

/*  Count of Rank of each astronaut */

SELECT Rank, COUNT(*) AS Total
FROM astronaut_data
GROUP BY Rank


-- COMMAND ----------

/* Average age of the astronauts in the data set */

SELECT AVG(DATEDIFF(year, 
CAST(`Birth_Date` AS DATE), CURRENT_DATE())) 
AS Avg_Age
FROM astronaut_data


-- COMMAND ----------

/*Top 3 common undergraduate major among astronauts in the data set*/

SELECT 
    Undergraduate_Major,
    COUNT(*) AS Count
FROM 
    astronaut_data
GROUP BY 
    Undergraduate_Major
ORDER BY 
    Count DESC
LIMIT 3;

