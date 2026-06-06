-- Dimension Table: Unique locations
CREATE OR REPLACE TABLE `supermart-analytics.supermart.dim_location` AS
SELECT DISTINCT
  `City`    AS City,
  `State`   AS State,
  `Region`  AS Region,
  `Country` AS Country
FROM `supermart-analytics.supermart.orders`
QUALIFY ROW_NUMBER() OVER (PARTITION BY `City` ORDER BY `State`) = 1;
