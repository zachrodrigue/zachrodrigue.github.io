# Furniture Sales Analysis

## Project Overview

Analyzed sales data to identify trends, opportunities, and performance metrics across different product categories and regions. Developed an interactive Excel dashboard with Power Query and pivot tables for executive reporting.

## Objective

Conduct comprehensive sales analysis to understand performance drivers, identify growth opportunities, and optimize business strategies for furniture sales.

## Key Questions Answered

- What are the top-performing and underperforming products and regions?
- What are the seasonal trends and revenue drivers?
- How do different shipping modes impact customer satisfaction and costs?
- Which cities are the strongest markets?
- What are the profitability patterns by product category?

## Key Achievements

- Developed interactive Excel dashboard to visualize sales performance across dimensions
- Identified key performance factors driving sales and customer engagement
- Provided actionable recommendations to optimize sales, profit, and operations
- Created dynamic reports using Power Query and pivot tables for stakeholder analysis

## Technologies Used

- **Excel** - Primary analysis and dashboard tool
- **Power Query** - Data extraction and transformation
- **Pivot Tables** - Dynamic data summarization and analysis
- **Pivot Charts** - Interactive visualizations
- **Conditional Formatting** - Visual data exploration

## Project Structure

```text
furniture-sales-analysis/
├── data/
│   └── Furniture_Sales.csv              # Raw sales transaction data (2014-2017)
├── plots/                                # Chart exports and visualizations
├── reports/                              # Analysis reports and findings
├── requirements.txt                      # Python dependencies (if applicable)
└── README.md                            # This file
```

## Key Metrics Analyzed

### Sales Performance

- **Total Sales (2014–2017)**: $741,999.80 across ~2,122 transactions
- **Total Profit**: $18,451.27 (2.5% profit margin)
- **Year-over-Year Growth**: 45% decline in 2015, 131% growth in 2016, 57% decline in 2017
- **Top Product Category**: Chairs with $328.4K in sales (44% of furniture category)
- **Regional Leader**: West region with $252.6K (34% of total sales)

### Geographic Analysis

- **Top 5 Cities**: New York City ($75.7K), Los Angeles ($54.0K), Seattle ($41.0K), Philadelphia ($36.5K), San Francisco ($36.4K)
- **Regional Distribution**: West ($252.6K, 34%), East ($208.3K, 28%), Central ($163.8K, 22%), South ($117.3K, 16%)
- **Highest Sales State**: California with $156.1K in revenue
- **Underperforming Areas**: South region with lowest regional sales; Montana with minimal market penetration ($64 total)

### Product Performance

- **Top Sub-Categories by Sales**: Chairs ($328.4K), Tables ($207.0K), Bookcases ($114.9K)
- **Lowest Performing Sub-Category**: Furnishings with $91.7K in sales (consider promotional focus or discontinuation)
- **Best Performers**: Chairs dominate with 44% of total furniture sales
- **Category Performance**: Wide variance across furniture types; chairs show consistent strong performance while furnishings lag

### Operational Metrics

- **Shipping Methods**: Standard Class dominates with 59% of shipments
- **Average Shipment Duration**: 4 days overall; Standard Class (5 days), Same-Day delivery (0 days)
- **Delivery Efficiency**: Same-Day shipping available but underutilized; Standard Class most cost-effective
- **Peak Shipping Periods**: December shows highest shipment volume; February shows lowest activity

## Key Findings Summary

- **Seasonal Patterns**: Strong peak in December (holiday shopping); weakness in February with 58% lower sales than December
- **Volatile Growth**: Significant fluctuations in YoY performance (131% growth in 2016 followed by 57% decline in 2017) indicate market volatility or operational challenges
- **Regional Disparity**: West and East regions drive 62% of total sales; South region significantly underperforms with only 16% market share
- **Product Mix**: Chairs dominate sales but furnishings underperform; suggests opportunity to reallocate resources or improve furnishings marketing
- **Profit Margin Challenges**: Despite $742K in sales, profit of only $18.5K (2.5% margin) indicates pricing or cost pressures

## Dashboard Components

### Sheet 1: Sales Overview

- Total sales KPI
- Sales trend line (monthly)
- Sales by category pie chart
- Top 10 cities bar chart

### Sheet 2: Regional Analysis

- Map or regional breakdown
- Sales by region/state
- Growth rate comparison
- Regional profitability

### Sheet 3: Product Deep Dive

- Product category performance
- Price vs. Volume analysis
- Profit margin comparison
- Product-level trends

### Sheet 4: Operational Insights

- Shipping method analysis
- Customer segmentation metrics
- Payment term analysis
- Cost structure breakdown

### Sheet 5: Executive Summary

- Dashboard with key metrics
- Trend indicators and alerts
- Performance vs. targets
- Action items and recommendations

## How to Use

### Opening the Dashboard

1. Download `furniture_sales_dashboard.xlsx`
2. Open in Microsoft Excel (2016 or later)
3. Enable Data Connections if prompted
4. Use slicers/filters to explore data by region, product, date

### Refreshing Data

```text
Data → Refresh All
(or right-click on pivot tables → Refresh)

```

### Modifying Pivot Tables

1. Right-click pivot table → Pivot Table Options
2. Adjust fields, filters, and calculations as needed
3. Update pivot charts accordingly

### Creating New Analysis

1. Copy raw data to new sheet
2. Create pivot table: Insert → Pivot Table
3. Select desired fields for rows, columns, values
4. Create corresponding pivot chart

## Data Source & Size

- **Source**: Furniture Sales Database curated by Freedom Oboh
- **Time Period**: 2014–2017 (4 years of sales history)
- **Records**: ~2,122 transactions across all regions and categories
- **Features**: 20 attributes per transaction including Order Date, Ship Date, Sales, Profit, Region, Segment, Product Category, Sub-Category, Quantity, Shipping Mode
- **Geographic Scope**: United States (4 regions, 49 states, 500+ cities)

## Methodology

- **Data Cleaning**: Handled missing values, standardized formats, removed duplicates
- **Data Transformation**: Used Power Query for ETL processes
- **Pivot Analysis**: Created 8+ pivot tables for multi-dimensional analysis
- **Visualization**: Developed charts for executive-level insights
- **Trend Analysis**: Identified patterns and anomalies in sales data
- **Recommendation Development**: Generated action items based on findings

## Strategic Recommendations

### 1. Product Strategy

- Focus on high-margin categories
- Consider discontinuing low-performing SKUs
- Cross-sell complementary products
- Optimize pricing for value categories

### 2. Geographic Expansion

- Invest in underperforming regions
- Replicate success factors from top cities
- Customize regional offerings
- Expand distribution in growth markets

### 3. Operational Efficiency

- Optimize shipping method mix
- Negotiate better freight rates
- Improve supply chain timing
- Reduce carrying costs for slow-movers

### 4. Customer Focus

- Segment customers by profitability
- Create targeted retention programs
- Personalize offerings by region
- Improve post-sale support

## Excel Skills Demonstrated

- ✓ Power Query for data transformation
- ✓ Pivot Tables for data summarization
- ✓ Pivot Charts for visualization
- ✓ Conditional Formatting for insights
- ✓ Slicers and filters for interactivity
- ✓ VLOOKUP and INDEX/MATCH for lookups
- ✓ IF, SUMIF, COUNTIF for calculations
- ✓ Named ranges for formula clarity

## Author

Rodrigue Deguenon

## Date

June 2025

## Links

- 📊 [Interactive Dashboard](https://1drv.ms/x/c/67671d55fee3b341/ERE_h7DobQdOuV233ME37EYB1QpP0gYoMQqjqmyLswiblw)
- 📄 [Full Report](./reports/Furniture%20Sales%20Analysis%20Report.pdf)
