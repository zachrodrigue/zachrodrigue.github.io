# Chocolate Sales Dashboard

## Project Overview

Developed an interactive Power BI report to analyze and visualize chocolate sales trends and performance metrics, enabling data-driven decision making for the business.

## Objective

Create comprehensive dashboards to track chocolate sales performance, identify trends by product and channel, and provide actionable insights for revenue optimization.

## Key Questions Answered

- What are the sales trends across different time periods and product types?
- How do different sales channels perform?
- Which chocolate products are top performers?
- What are the shipment and distribution patterns?
- How can sales strategies be optimized for growth?

## Key Achievements

- Created a dynamic two-page report for comprehensive chocolate sales analysis
- Developed DAX measures to calculate key performance indicators (KPIs) and dynamic visuals
- Delivered actionable insights to optimize sales channels and recommendations to increase revenue
- Enabled stakeholders to explore data interactively with drill-down capabilities

## Technologies Used

- **Power BI** - Interactive dashboarding and business intelligence
- **DAX (Data Analysis Expressions)** - Advanced calculated measures and metrics
- **Power Query** - Data transformation and ETL
- **Data Modeling** - Dimensional modeling for analytics

## Project Structure

```text
chocolate-sales-analysis/
├── dashboard_files/
│   ├── chocolate_sales.pbix              # Power BI project file
│   ├── data_model_diagram.png           # Data model visualization
│   └── dashboard_preview.png            # Dashboard screenshot
├── data/                                 # Source data
│   ├── Products.csv
│   ├── Shipments.csv
│   ├── People.csv
│   ├── Locations.csv
│   ├── Calendar.csv
│   └── README.md                        # Data documentation
├── plots/                                # Dashboard page screenshots
│   ├── sales_overview.png
│   ├── shipment_analysis.png
│   ├── product_detail.png
│   └── kpi_summary.png
├── reports/
│   └── chocolate-sales-report.pdf       # Comprehensive analysis report
└── README.md                             # Project documentation
```

## Key Metrics Tracked

### Primary KPIs

- **Total Sales**: $34.0M (February 2023 - February 2024)
- **Total Profit**: $20.5M with 60.3% profit margin
- **Total Boxes Sold**: 2.08M units
- **Total Shipments**: 6,113 shipments
- **Total Costs**: $13.5M

### Sales Performance

- **Peak Month**: December 2023 ($2.94M in sales)
- **Lowest Month**: November 2023 ($2.28M in sales)
- **Top Product**: Organic Choco Syrup ($2.11M in sales)
- **Top Salesperson**: Kelci Walkden ($1.52M in sales)
- **Top Region**: New Zealand ($5.88M in sales)

### Secondary Metrics

- **Profit Leaders**: Peanut Butter Cubes ($1.77M), 99% Dark & Pure ($1.46M)
- **Regional Distribution**: Balanced across 6 regions (NZ, Canada, Australia, USA, India, UK)
- **Seasonal Patterns**: Strong December holiday spike; November dip presents opportunity
- **Shipment Trends**: Peak shipments in December (529), lowest in April (425)

## Key Findings Summary

### Sales Revenue & Volume

- **Total Revenue**: $34.0M across 2.08M boxes sold during Feb 2023 - Feb 2024
- **Top 5 Products by Sales**:
  1. Organic Choco Syrup – $2.11M
  2. Peanut Butter Cubes – $2.03M
  3. 99% Dark & Pure – $1.98M
  4. Manuka Honey Choco – $1.84M
  5. Fruit & Nut Bars – $1.83M

### Profitability Insights

- **Total Profit**: $20.5M with 60.3% overall profit margin
- **Top 5 Products by Profit**:
  1. Peanut Butter Cubes – $1.77M
  2. 99% Dark & Pure – $1.46M
  3. Manuka Honey Choco – $1.45M
  4. Smooth Silky Salty – $1.45M
  5. Orange Choco – $1.42M

### Regional & Salesperson Performance

- **Top 5 Salespersons**: Kelci Walkden ($1.52M), Rafaelita Blaksland ($1.50M), Husein Augar ($1.47M), Dotty Strutley ($1.42M), Oby Sorrel ($1.40M)
- **Regional Leaders**: New Zealand ($5.88M), Canada ($5.73M), Australia ($5.70M), India ($5.65M), USA ($5.62M), UK ($5.47M)

### Seasonal Trends

- **Peak Season**: December 2023 with $2.94M in sales and 1.83M profit
- **Weak Period**: November 2023 with $2.28M in sales (12% lower than December)
- **Cost Patterns**: Follow sales trends, with peaks in high-demand months (May and January)
- **Shipment Volume**: Peak in December (529 shipments), lowest in April (425)

## Dashboard Pages

1. **Main Dashboard** - Overview of sales performance with key metrics
2. **Product Detail** - Deep dive into product-level performance metrics

## How to Access

### View Live Dashboard

- 📊 [Interactive Power BI Dashboard](https://app.powerbi.com/view?r=eyJrIjoiOGE4NWViYjgtZjMzYS00MzlkLWJmNGUtYjM3YmMxMGVmMzI5IiwidCI6IjU5N2NlOTZmLWY2NzgtNDQ4YS1hNmE0LTAyZGJmYTUyMGQyYyJ9)

### Run Locally

1. Download and install [Power BI Desktop](https://powerbi.microsoft.com/en-us/desktop/)
2. Open `chocolate_sales_dashboard.pbix` file
3. Refresh data connections (if using live data source)
4. Interact with visualizations and filters

## Data Source & Size

- **Source**: Sample chocolate sales dataset from [Chandoo](https://www.youtube.com/@chandoo_)
- **Time Period**: February 2023 - February 2024 (13 months)
- **Records**: 6,113 shipment transactions analyzed across 2.08M boxes
- **Tables**: Products, Shipments, People (Salespersons), Locations (Regions), Calendar
- **Data Link**: [ac-sample-data.xlsx](https://github.com/chandoo-org/Power-BI/blob/main/ac-sample-data.xlsx)

## Methodology

- **Data Import**: Loaded all tables from sample dataset into Power BI
- **Data Modeling**:
  - Adjusted relationships between fact and dimension tables
  - Created missing relationship between Shipments (fact) and Calendar (dimension)
  - Marked Calendar as the official Date table for time intelligence functions
- **Data Type Optimization**: Ensured accurate data types across all columns
- **Feature Engineering**: Added custom date fields (month, quarter, year) to Calendar table
- **DAX Development**: Created calculated measures for KPI tracking and performance analysis
- **Visualization Design**: Built interactive dashboards for sales, profitability, and shipment analysis
- **Trend Analysis**: Identified seasonal patterns, regional performance, and product profitability

## Strategic Recommendations

### High Priority

1. **Product Strategy**
   - Promote high-profit items such as Peanut Butter Cubes ($1.77M profit) and 99% Dark & Pure ($1.46M profit)
   - Bundle slower-moving products with best-sellers to increase basket size
   - Investigate why Organic Choco Syrup leads in sales but ranks lower in profit

2. **Seasonal Campaigns**
   - Build on December holiday spikes with targeted promotional campaigns
   - Address November dips (12% lower than December) through early holiday campaigns and pre-sales
   - Prepare inventory and marketing 6 weeks before peak December season

### Medium Priority

1. **Regional Focus**
   - Use New Zealand and Canada as test markets for premium product launches
   - Investigate UK's underperformance ($5.47M, lowest among regions) with targeted regional strategies
   - Leverage top performers' strategies across lower-performing regions

2. **Operational Efficiency**
   - Optimize shipping costs during peak demand months (May, October, December) to protect 60.3% margins
   - Analyze April's low shipment volume (425) to identify improvement opportunities

### Long-Term

1. **Data Enrichment**
   - Integrate customer demographics and purchasing behavior data
   - Track marketing ROI to correlate campaigns with sales performance
   - Monitor cost trends to identify opportunities for 5-10% margin improvement

## Project Insights

This analysis reveals **clear seasonal patterns** with December consistently outperforming other months by significant margins. The **60.3% profit margin** demonstrates strong profitability, though product mix optimization could further improve returns.

Key opportunities include:

- Leveraging the December peak to capture maximum revenue
- Addressing the November dip through strategic pre-holiday campaigns  
- Optimizing product bundles based on profit margins rather than sales volume
- Scaling successful strategies from top performers (Kelci Walkden, New Zealand region) across the organization

Future analysis with expanded datasets including customer behavior, marketing attribution, and cost breakdowns could enable margin improvements of 5-10% through better product targeting and campaign alignment.

## Author

Rodrigue Z. Deguenon

## Date

September 2025

## Links

- 📊 [Interactive Dashboard](https://app.powerbi.com/view?r=eyJrIjoiOGE4NWViYjgtZjMzYS00MzlkLWJmNGUtYjM3YmMxMGVmMzI5IiwidCI6IjU5N2NlOTZmLWY2NzgtNDQ4YS1hNmE0LTAyZGJmYTUyMGQyYyJ9)
- 📄 [Full Report](./reports/chocolate-sales-report.pdf)

## References

- Chandoo. (2024). Power BI Sample Data. Retrieved from <https://github.com/chandoo-org/Power-BI>
- Original Analysis: Chocolate Sales Analysis Report (September 8, 2025)
