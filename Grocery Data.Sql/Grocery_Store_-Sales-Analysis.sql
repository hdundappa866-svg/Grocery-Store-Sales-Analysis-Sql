Kpi Requirment__
========================================================================
Total Sales
=========================================================================

SELECT *FROM [Grocery Store].[dbo].[Grocery Data]
SELECT CONCAT(CAST(Sum(Total_Sales)/1000000 
As 
DECIMAL(10,2)),'M')
AS Toatal_Sales_Millions
FROM [Grocery Store].[dbo].[Grocery Data]
============================================================================
Avg Sales
=============================================================================
Select CAST(AVG(Total_Sales) 
AS DECIMAL (10,3))
AS AVG_Sales FROM [Grocery Store].[dbo].[Grocery Data]
SELECT COUNT(*)FROM [Grocery Store].[dbo].[Grocery Data]


SELECT Item_Fat_Content, CONCAT(CAST(Sum(Total_Sales)/1000000
As DECIMAL(10,2)),'M')
AS Toatal_Sales_Millions
FROM [Grocery Store].[dbo].[Grocery Data]
WHERE Item_Fat_Content IN ('Low Fat','Regular')
GROUP BY Item_Fat_Content;

SELECT (Rating), Count(Rating)
FROM [Grocery Store].[dbo].[Grocery Data]
WHERE Rating IN ('5','4','3','2','1')
GROUP BY Rating;

SELECT *FROM [Grocery Store].[dbo].[Grocery Data]
Select 
Item_Fat_Content,
Cast(SUM(Total_Sales) As decimal(10,2)) As Total_Sales
FROM [Grocery Store].[dbo].[Grocery Data]
Group BY Item_Fat_Content
Order By Item_Fat_Content Desc

SELECT *FROM [Grocery Store].[dbo].[Grocery Data]
SELECT  
Item_Fat_Content,
Cast(sum(Total_Sales) AS Decimal(10,2)) AS Total_Sales,
Cast(Avg(Total_Sales) As Decimal(10,2)) AS Avg_Sales
FROM [Grocery Store].[dbo].[Grocery Data]
WHERE Rating IN ('5','4','3','2','1')
Group By Item_Fat_Content;
==================================================================================================
Avg Rating
==================================================================================================
Select Rating,
COUNT(Rating) AS Rating_Rows,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
    FROM [Grocery Store].[dbo].[Grocery Data]
    GROUP BY     Rating
==================================================================================================
Total Number Of Item
=================================================================================================
SELECT
    Item_Type,
    COUNT(*) AS [No. Items],
    COUNT(*) AS Total_Rows,
    SUM(Total_Sales) As Total_Sales
    FROM [Grocery Store].[dbo].[Grocery Data]
Where Outlet_Establishment_Year=2015
GROUP BY     Item_Type
Order By Total_Sales Desc;
==================================================================================================
Total Sales By Fat Content
==================================================================================================
SELECT
    Item_Fat_Content,
    Concat(
    CAST(SUM(Total_Sales)/1000 AS DECIMAL(10,2)),'K') AS Total_Sales_Thousands,
    CAST(AVG(Total_Sales) AS DECIMAL(10,2)) AS Avg_Sales,
    COUNT(*) AS [No. Items],
    COUNT(*) AS Total_Rows,
    COUNT(Rating) AS Rating_Rows,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM [Grocery Store].[dbo].[Grocery Data]
Where Outlet_Establishment_Year=2015
GROUP BY Item_Fat_Content
Order By Total_Sales_Thousands Desc;
====================================================================================================================
Total Sales By Item Type
====================================================================================================================
SELECT
    Item_Type,
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(AVG(Total_Sales) AS DECIMAL(10,2)) AS Avg_Sales,
    COUNT(*) AS [No. Items],
    COUNT(*) AS Total_Rows,
    COUNT(Rating) AS Rating_Rows,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM [Grocery Store].[dbo].[Grocery Data]
Where Outlet_Establishment_Year=2015
GROUP BY     Item_Type
Order By Total_Sales Desc;
=================================================================================================================
Fat content by outlet total sales
=================================================================================================================
SELECT
    Item_Fat_Content,Outlet_Location_Type,
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(AVG(Total_Sales) AS DECIMAL(10,2)) AS Avg_Sales,
    COUNT(*) AS [No. Items],
    COUNT(*) AS Total_Rows,
    COUNT(Rating) AS Rating_Rows,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM [Grocery Store].[dbo].[Grocery Data]
GROUP BY         Item_Fat_Content,Outlet_Location_Type
Order By Total_Sales Desc;

SELECT
    Outlet_Location_Type,
    ISNULL(SUM(CASE
            WHEN Item_Fat_Content = 'Low Fat'
            THEN Total_Sales
            ELSE 0 END), 0) AS Low_Fat,

    ISNULL(sum(case
    When Item_Fat_Content= 'Regular' 
    Then Total_Sales ELSE 0
    END),0) As Regular,

    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM [Grocery Store].[dbo].[Grocery Data]
GROUP BY   Outlet_Location_Type
Order By Total_Sales Desc;
==================================================================================================================
Total Sales by Estabilishment Year
=================================================================================================================
SELECT
    Outlet_Establishment_Year,
   CONCAT( CAST(SUM(Total_Sales)/1000 AS DECIMAL(10,2)),'k') AS Total_Sales
FROM [Grocery Store].[dbo].[Grocery Data]
GROUP BY  Outlet_Establishment_Year
Order By Outlet_Establishment_Year Desc;
=================================================================================================
Percentage of sale outlet size
==================================================================================================
SELECT
    Outlet_Size,
CONCAT(CAST(SUM(Total_Sales) / 1000.0 AS DECIMAL(10,2)),
        'K') AS Total_Sales,
        CAST(SUM(Total_Sales) * 100.0/ SUM(SUM(Total_Sales)) OVER()
        AS DECIMAL(10,2)) AS Total_Sales_Percentage
FROM [Grocery Store].[dbo].[Grocery Data]
GROUP BY Outlet_Size;

=====================================================================================================
Sales By Outlet Location
====================================================================================================
Select Outlet_Location_Type,
    concat(CAST(SUM(Total_Sales)/1000 AS DECIMAL(10,2)),'k') AS Total_Sales,
    CAST(SUM(Total_Sales) * 100.0/ SUM(SUM(Total_Sales)) OVER()
        AS DECIMAL(10,2)) AS Total_Sales_Percentage,
    CAST(AVG(Total_Sales) AS DECIMAL(10,2)) AS Avg_Sales,
    COUNT(*) AS [No. Items],
    COUNT(*) AS Total_Rows,
    COUNT(Rating) AS Rating_Rows,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM [Grocery Store].[dbo].[Grocery Data]
GROUP BY       Outlet_Location_Type
Order By Total_Sales Desc;
=======================================================================================================
All Metrics By Outlet Type
=======================================================================================================

Select Outlet_Type,
    concat(CAST(SUM(Total_Sales)/1000 AS DECIMAL(10,2)),'k') AS Total_Sales,
    CAST(SUM(Total_Sales) * 100.0/ SUM(SUM(Total_Sales)) OVER()
        AS DECIMAL(10,2)) AS Total_Sales_Percentage,
    CAST(AVG(Total_Sales) AS DECIMAL(10,2)) AS Avg_Sales,
    COUNT(*) AS [No. Items],
    COUNT(*) AS Total_Rows,
    COUNT(Rating) AS Rating_Rows,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM [Grocery Store].[dbo].[Grocery Data]
GROUP BY       Outlet_Type
Order By Total_Sales Desc;
