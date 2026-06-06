# 🏪 SuperMart Retail Sales Intelligence Platform

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![BigQuery](https://img.shields.io/badge/BigQuery-4285F4?style=for-the-badge&logo=googlecloud&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)

## 📊 Project Overview
An end-to-end Retail Sales Intelligence Platform built on the Kaggle Superstore dataset (9,994 orders). This project demonstrates the complete data analyst workflow - from raw data ingestion to a 5-page interactive Power BI dashboard.

**Built for:** Data Analyst Portfolio | Iqlytics Application

## 🛠️ Tech Stack
| Tool | Purpose |
|---|---|
| Google BigQuery | Cloud data warehouse |
| SQL | Data modeling & transformation |
| Power Query | ETL & data cleaning |
| Power BI Desktop | Data modeling, DAX, Dashboard |
| GitHub | Version control & portfolio |

## 🗄️ Database Architecture — Star Schema

```
dim_customers (793 rows)
      |
      * Customer_ID
fact_orders (9,994 rows) ──── Product_ID ──── dim_products (1,862 rows)
      *
      | City
dim_location (604 rows)
```

## 📁 Project Structure
```
supermart-retail-analytics/
│
├── sql/
│   ├── 01_fact_orders.sql
│   ├── 02_dim_customers.sql
│   ├── 03_dim_products.sql
│   └── 04_dim_location.sql
│
├── dashboard/
│   └── SuperMart_Dashboard.pdf
│
└── README.md
```

## 🔄 Phase 1 — Data Engineering (BigQuery SQL)

### Star Schema Design
Transformed raw Superstore CSV into a proper star schema with 4 tables:

- **fact_orders** - 9,994 transaction rows with calculated fields
- **dim_customers** - 793 unique customers with segments
- **dim_products** - 1,862 unique products with categories
- **dim_location** - 604 unique locations with regions

### Key SQL Features Used
- `CREATE OR REPLACE TABLE` for idempotent table creation
- `SAFE_DIVIDE()` for null-safe profit margin calculation
- `QUALIFY ROW_NUMBER()` for deduplication
- `CASE WHEN` for discount categorization

## 📊 Phase 2 — Power BI Dashboard (5 Pages)

### Page 1 — Executive Summary
- 4 KPI Cards: Total Revenue, Total Profit, Profit Margin %, Total Orders
- Line Chart: Monthly Revenue Trend
- Donut Chart: Revenue by Region
- Bar Chart: Revenue by Category
- Year/Month Slicer

### Page 2 — Sales Trends Analysis
- YTD Revenue, MoM Growth %, Avg Order Value cards
- Line Chart: Monthly Revenue by Customer Segment
- Column Chart: Quarterly Revenue Trend

### Page 3 — Product Performance
- Top 10 Products by Revenue (Bar Chart)
- Revenue by Category & Sub-Category (Treemap)
- Profit vs Discount Analysis (Scatter Chart)

### Page 4 — Customer Segments
- Revenue by Segment (Donut Chart)
- Top Customers by Revenue (Bar Chart)
- Segment × Category Revenue Matrix

### Page 5 — Returns & Data Quality
- Discounted Orders Count
- Orders & Profit by Discount Category
- Product-level Profit & Margin Table

## 📐 DAX Measures

```dax
Total Revenue = SUM(fact_orders[Sales])

Total Profit = SUM(fact_orders[Profit])

Profit Margin % = DIVIDE([Total Profit], [Total Revenue], 0) * 100

YTD Revenue = TOTALYTD(SUM(fact_orders[Sales]), fact_orders[Order_Date])

MoM Growth % = 
VAR CurrentMonth = [Total Revenue]
VAR LastMonth = CALCULATE([Total Revenue], DATEADD(fact_orders[Order_Date], -1, MONTH))
RETURN DIVIDE(CurrentMonth - LastMonth, LastMonth, 0) * 100

Total Orders = DISTINCTCOUNT(fact_orders[Order_ID])

Avg Order Value = DIVIDE([Total Revenue], [Total Orders], 0)
```

## 🔍 Key Business Insights

| Insight | Finding |
|---|---|
| 📈 Peak Season | November is highest revenue month |
| 🌍 Top Region | West leads at 34.5% of revenue |
| 💻 Top Category | Technology dominates all segments |
| 👥 Top Segment | Consumer = 50.56% of revenue |
| 📉 Discount Impact | High discounts (>30%) generate negative profit |
| 🏆 Top Customer | Sean Miller — highest revenue customer |
| 🖨️ Top Product | Canon imageCLASS 2200 Advanced Copier |

## 📸 Dashboard Preview
See `dashboard/SuperMart_Dashboard.pdf` for full 5-page dashboard screenshots.

## 🚀 How to Run This Project

1. Download the Kaggle Superstore dataset from [here](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
2. Upload CSV to Google BigQuery as `orders` table under project `supermart-analytics` dataset `supermart`
3. Run SQL scripts in `/sql` folder in order (01 → 04)
4. Open Power BI Desktop → Get Data → Google BigQuery
5. Connect using project ID `supermart-analytics`
6. Load all 4 tables and build relationships in Model View
7. Create DAX measures as listed above
8. Build 5-page dashboard

## 👤 Author
**Vidur Agarwal**
- Built as portfolio project for Data Analyst roles
- Dataset: [Kaggle Superstore Sales](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
