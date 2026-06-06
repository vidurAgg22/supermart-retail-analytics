-- Fact Table: Every order transaction
CREATE OR REPLACE TABLE `supermart-analytics.supermart.fact_orders` AS
SELECT
  `Order ID`    AS Order_ID,
  `Order Date`  AS Order_Date,
  `Ship Date`   AS Ship_Date,
  `Ship Mode`   AS Ship_Mode,
  `Customer ID` AS Customer_ID,
  `Product ID`  AS Product_ID,
  `City`        AS City,
  `State`       AS State,
  `Region`      AS Region,
  `Sales`       AS Sales,
  `Quantity`    AS Quantity,
  `Discount`    AS Discount,
  `Profit`      AS Profit,
  ROUND(SAFE_DIVIDE(`Profit`, `Sales`) * 100, 2) AS Profit_Margin_Pct,
  CASE
    WHEN `Discount` > 0.3 THEN 'High Discount'
    WHEN `Discount` > 0   THEN 'Low Discount'
    ELSE 'No Discount'
  END AS Discount_Category
FROM `supermart-analytics.supermart.orders`;
