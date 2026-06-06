-- Dimension Table: Unique customers
CREATE OR REPLACE TABLE `supermart-analytics.supermart.dim_customers` AS
SELECT DISTINCT
  `Customer ID`   AS Customer_ID,
  `Customer Name` AS Customer_Name,
  `Segment`       AS Segment
FROM `supermart-analytics.supermart.orders`;
