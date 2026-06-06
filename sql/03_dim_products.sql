-- Dimension Table: Unique products
CREATE OR REPLACE TABLE `supermart-analytics.supermart.dim_products` AS
SELECT DISTINCT
  `Product ID`   AS Product_ID,
  `Product Name` AS Product_Name,
  `Category`     AS Category,
  `Sub-Category` AS Sub_Category
FROM `supermart-analytics.supermart.orders`
QUALIFY ROW_NUMBER() OVER (PARTITION BY `Product ID` ORDER BY `Product Name`) = 1;
