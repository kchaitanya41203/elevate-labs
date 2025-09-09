SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

CREATE DATABASE retail_project;
USE retail_project;

SHOW TABLES;
SELECT * FROM retail_business_data LIMIT 10;

SELECT 
    SUM(CASE WHEN Revenue IS NULL THEN 1 ELSE 0 END) AS Null_Revenue,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit
FROM retail_business_data;

-- Profit Margin by Category
SELECT 
    Category,
    SUM(Profit) AS TotalProfit,
    SUM(Revenue) AS TotalRevenue,
    ROUND(SUM(Profit)/SUM(Revenue)*100,2) AS ProfitMarginPercent
FROM retail_business_data
GROUP BY Category
ORDER BY ProfitMarginPercent ASC;

-- Profit Margin by Category & Season
SELECT 
    Category,
    Season,
    ROUND(SUM(Profit)/SUM(Revenue)*100,2) AS ProfitMarginPercent
FROM retail_business_data
GROUP BY Category, Season
ORDER BY ProfitMarginPercent ASC;

-- Profit Margin by Region & Category
SELECT 
    Region,
    Category,
    ROUND(SUM(Profit)/SUM(Revenue)*100,2) AS ProfitMarginPercent
FROM retail_business_data
GROUP BY Region, Category
ORDER BY ProfitMarginPercent ASC;


