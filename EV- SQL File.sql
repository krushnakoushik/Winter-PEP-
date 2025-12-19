CREATE DATABASE ev_dashboard;
USE ev_dashboard;

-- Total Vehicles
SELECT COUNT(*) AS total_vehicles
FROM electric_vehicle_population_data;

-- Average Electric Range
SELECT ROUND(AVG(`Electric Range`), 2) AS avg_electric_range
FROM electric_vehicle_population_data
WHERE `Electric Range` IS NOT NULL;

-- Total BEV Vehicles and Percentage of Total BEV
SELECT 
    COUNT(*) AS total_bev,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM electric_vehicle_population_data),
        2
    ) AS bev_percentage
FROM electric_vehicle_population_data
WHERE `Electric Vehicle Type` = 'Battery Electric Vehicle (BEV)';

-- Total PHEV Vehicles and Percentage of Total PHEV
SELECT 
    COUNT(*) AS total_phev,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM electric_vehicle_population_data),
        2
    ) AS phev_percentage
FROM electric_vehicle_population_data
WHERE `Electric Vehicle Type` = 'Plug-in Hybrid Electric Vehicle (PHEV)';


