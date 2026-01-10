# Mint Classics Inventory Optimization

## Project Overview

Conducted an exploratory data analysis on Mint Classics' inventory and warehouse data in a relational database to identify patterns that may influence inventory reduction or reorganization, supporting the closure of a storage facility.

## Objective

Analyze the Mint Classics database to identify optimization opportunities for inventory management, warehouse efficiency, and product performance, ultimately supporting strategic business decisions regarding warehouse consolidation.

## Key Questions Answered

- Which products should be prioritized or discontinued due to low turnover?
- Can underperforming warehouses be consolidated without overburdening others?
- What inventory levels would support a warehouse closure?
- Which product lines are most/least profitable?

## Key Achievements

- Identified Warehouse South as a candidate for closure, supporting strategic business decision
- Planned redistribution of 79,380 units of inventory to other warehouses without overburdening them
- Identified slow-moving products and low inventory turnover ratios to reduce excess inventory
- Provided data-driven recommendations for product line optimization

## Technologies Used

- **SQL** - Complex database queries and analysis
- **MySQL** - Relational database management
- **MySQL Workbench** - Database visualization and query development
- **Entity-Relationship Diagrams (ERD)** - Database schema documentation

## Project Structure

```text
mint-classics-analysis/
├── data/
│   └── Mint_Classics_Database/          # Database files and schema
├── database/
│   ├── mintclassicsDB.sql              # Database creation script
│   ├── wittig_school_erd.mwb.bak       # ERD backup file
│   └── wittig_school_model.mwb         # MySQL Workbench model
├── queries/
│   └── mintclassics_queries.sql         # Analysis queries
├── plots/                               # Visualizations and results exports
├── reports/                             # Analysis reports and findings
├── eda_script.sql                       # Main EDA SQL script
└── README.md                            # This file
```

## Key Findings Summary

### Warehouse Analysis

- **Warehouse South Consolidation**: Warehouse South is the primary closure candidate with 79,380 units (lowest inventory) stored across low-demand product lines
- **Capacity Utilization**: Warehouse South operates at lowest percentage capacity; other facilities (North, East, West) have sufficient space to absorb redistribution
- **Low-Revenue Product Lines**: Trains, Ships, Trucks and Buses (stored in South) are among the least profitable product lines in the catalog
- **Redistribution Feasibility**: 79,380 units can be redistributed without exceeding 85% capacity limits in remaining warehouses

### Inventory Performance

- **Overstocked Products**: 1985 Toyota Supra (S18_3233) has 7,733 units in stock with 0 units sold—represents largest inventory holding without sales
- **Slow-Moving Inventory**: Multiple products show inventory turnover ratios <1, indicating items not selling within standard holding periods
- **Inventory Surplus**: Significant overstocking identified across multiple product lines; surplus items represent tied-up capital and storage costs
- **Non-Moving Stock**: Analysis identified products with zero sales; candidates for promotional clearance or discontinuation

### Revenue & Profitability

- **Product Line Revenue Disparity**: Classic Cars and Motorcycles generate significantly higher revenue than Trains, Ships, and Trucks/Buses despite similar inventory levels
- **High-Performing Products**: Top 10 revenue-generating products should be prioritized for restocking and marketing
- **Underperforming Products**: Bottom 10 products generate minimal revenue; strong candidates for discontinuation or deep discounting

### Seasonal Patterns

- **Warehouse South Seasonality**: Trains, Ships, and Trucks/Buses show clear seasonal demand variations—closure should be timed during low-demand periods
- **Predictable Demand**: Seasonal trends enable optimal timing for warehouse transition to minimize disruption

## Database Schema

- **Products Table**: 110 classic car and collectible items with productCode, productName, quantityInStock, warehouseCode, priceEach, reorderLevel
- **Orders Table**: 326 total orders with orderNumber, orderDate, requiredDate, shippedDate, status, customerNumber
- **OrderDetails Table**: Line-item transaction history with orderNumber, productCode, quantityOrdered, priceEach
- **Customers Table**: 98 customer records with geography, credit information, customer ID
- **Warehouses Table**: 4 facilities (North, South, East, West) with warehouseCode, warehouseName, warehosePctCap (capacity percentage)
- **Relationships**: Products linked to Warehouses via warehouseCode; Orders linked to OrderDetails via orderNumber

## How to Reproduce

### Prerequisites

- MySQL Server running
- MySQL Workbench (optional but recommended)
- Access to Mint Classics database

### Running the Analysis

```sql
-- Connect to Mint Classics database
USE mintclassics;

-- Run queries from eda_script.sql
-- Queries are organized by analysis type (warehouse, product, inventory)

-- View schema
SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'mintclassics';
```

### Creating Database (if needed)

```bash
# Import database from SQL file
mysql -u [username] -p < mintclassics_schema.sql
```

## Methodology

- **Data Exploration**: Examined all tables and relationships
- **Query Development**: Created 25+ queries to answer business questions
- **Performance Analysis**: Calculated inventory turnover, profit margins, utilization rates
- **Consolidation Planning**: Modeled impact of warehouse closure scenarios
- **Recommendation Development**: Based findings on data-driven analysis

## Key SQL Queries Included

1. **Warehouse Utilization Analysis** - Capacity usage by location
2. **Product Performance Ranking** - Revenue and turnover metrics
3. **Slow-Moving Inventory** - Products with >2 year turnover
4. **Customer Geography** - Order patterns by region
5. **Inventory Redistribution Model** - Closure impact simulation

## Strategic Recommendations

### 1. Close Warehouse South (Primary Action)

- Consolidate 79,380 units to Warehouses North, East, and West
- Time closure during identified low-demand period based on seasonal analysis
- Execute in phases to maintain operations during transition
- Expected cost savings from reduced facility overhead and labor

### 2. Optimize Inventory Levels

- **Reduce Overstocking**: Launch promotional campaigns to clear excess inventory (e.g., 1985 Toyota Supra with 7,733 units, 0 sales)
- **Address Understocking**: Increase stock for high-demand products to avoid stockouts and capture lost sales
- **Implement Just-in-Time**: For high-turnover products, shift to more frequent smaller orders
- **Discontinue Non-Movers**: Evaluate bottom 10 revenue-generating products for discontinuation

### 3. Product Portfolio Optimization

- **Prioritize High-Performers**: Focus marketing and restocking on top 10 revenue-generating products
- **Phase Out Low-Margin Items**: Trains and Ships generate significantly lower revenue; consider discontinuation
- **Improve Motorcycle & Cars Focus**: These categories drive majority of revenue; allocate more inventory and marketing resources
- **Clear Slow-Moving Inventory**: Run promotions on products with inventory turnover ratios <1

### 4. Demand Forecasting

- **Seasonal Planning**: Use identified seasonal patterns to optimize stock levels by quarter
- **Predictive Analytics**: Implement forecasting models to predict demand and reduce excess inventory
- **Monitor Turnover**: Continuously track inventory turnover ratios to identify emerging slow-movers early

## Files Reference

- **Main Analysis**: `eda_script.sql` - All queries with explanations and results
- **Schema**: See `data/schema_diagram.png` for visual database structure
- **Results**: CSV exports in `plots/` folder for further analysis

## Author

Rodrigue Z. Deguenon

## Date

January 2025

## Links

- 📄 [Full Report](./reports/mint_classics_eda_report.pdf)
- 💻 [SQL Queries](https://github.com/zachrodrigue/zachrodrigue.github.io/blob/main/documents/scripts/mint-classics/eda_script.sql)
