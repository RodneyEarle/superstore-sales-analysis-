# Superstore Sales Analysis (SQL)

## Overview
Analyzed 9,994 retail transactions (2014–2017) using PostgreSQL to identify profit drivers, regional performance, product-level profitability, and discount impact.

## Tools
- PostgreSQL / SQL
- pgAdmin
- (Optional) Tableau / Power BI for dashboard

## Key Business Questions
1. What is overall sales, profit, and margin?
2. Which regions drive revenue and profitability?
3. Which categories drive profit and which underperform?
4. What are the top and bottom products by profit?
5. How do discounts affect margin?

## Key Findings
- Total sales: **$2.30M**, total profit: **$286.4K**, overall margin: **12.47%**
- **West** is the top region (highest sales and margin ~14.94%)
- **Central** has the weakest margin (~7.92%)
- **Technology** and **Office Supplies** have strong margins (~17%)
- **Furniture** has very low margin (~2.49%) despite high sales
- Worst-loss products include **Cubify 3D printers** and **conference tables**, contributing to margin erosion

## Files
- `sql/analysis_queries.sql` — all SQL queries used in the analysis
- `dataset/` — source dataset (CSV)
- `dashboard/` — exported dashboard image 

## How to Reproduce
1. Create a PostgreSQL database (e.g., `ecommerce_analysis`)
2. Create a table schema matching the CSV columns
3. Import the CSV into PostgreSQL
4. Run queries from `sql/analysis_queries.sql`

## Power BI Dashboard

### Executive Summary
![Executive Summary](dashboard/executive_summary.png)

### Regional Performance
![Regional Performance](dashboard/regional_performance.png)

### Category Performance
![Category Performance](dashboard/category_performance.png)

### Product Analysis
![Product Analysis](dashboard/product_analysis.png)
