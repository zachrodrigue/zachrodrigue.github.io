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

- ✅ Identified Warehouse South as a candidate for closure, supporting strategic business decision
- ✅ Planned redistribution of 79,380 units of inventory to other warehouses without overburdening them
- ✅ Identified slow-moving products and low inventory turnover ratios to reduce excess inventory
- ✅ Provided data-driven recommendations for product line optimization

## Technologies Used

- **SQL** - Complex database queries and analysis
- **MySQL** - Relational database management
- **MySQL Workbench** - Database visualization and query development
- **Entity-Relationship Diagrams (ERD)** - Database schema documentation

## Project Structure

```text
mint-classics-analysis/
├── eda_script.sql              # Main SQL analysis queries
├── data/                        # Sample data and schema
│   ├── schema_diagram.png
│   ├── sample_data.csv
│   └── README.md               # Data documentation
├── plots/                       # Query results and visualizations
│   ├── warehouse_analysis.csv
│   ├── product_performance.csv
│   └── inventory_levels.csv
├── README.md                   # This file
└── ANALYSIS_NOTES.md          # Detailed query explanations
```

## Key Findings Summary

- **Warehouse Performance**: Warehouse South has lowest utilization (36.1% capacity); identified for consolidation
- **Inventory Distribution**: 79,380 units can be redistributed without exceeding 85% capacity limits
- **Slow-Moving Products**: Classic Cars (1968 Ford Mustang) and vintage motorcycles have 10+ year inventory turnover
- **Profitability**: Ships and trains generate 35% less revenue than motorcycles despite similar stock levels
- **Optimal Closure Plan**: Move inventory in phases to maintain operations during transition

## Database Schema

- **Products**: 110 classic car and collectible items with pricing and reorder info
- **Orders & OrderDetails**: Transaction history with 326 orders from 98 customers
- **Customers**: Geographic distribution and credit information
- **Warehouses**: 4 facilities (North, South, East, West) with capacity and stock levels
- **Inventory**: Stock quantities and warehouse assignments

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

1. **Close Warehouse South** - Consolidate operations to North and East facilities
2. **Product Portfolio Review** - Consider discontinuing or repositioning slow-moving items
3. **Inventory Optimization** - Implement just-in-time ordering for high-turnover products
4. **Regional Focus** - Increase marketing in high-order regions (North America, Europe)

## Files Reference

- **Main Analysis**: `eda_script.sql` - All queries with explanations and results
- **Schema**: See `data/schema_diagram.png` for visual database structure
- **Results**: CSV exports in `plots/` folder for further analysis

## Author

Rodrigue Z. Deguenon

## Date

January 2025

## Links

- 📄 [Full Report](../../documents/reports/mint_classics_eda_report.pdf)
- 💻 [SQL Queries](https://github.com/zachrodrigue/zachrodrigue.github.io/blob/main/documents/scripts/mint-classics/eda_script.sql)
