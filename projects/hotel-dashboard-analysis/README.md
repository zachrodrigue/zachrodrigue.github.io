# Hotel Revenue Dashboard

## Project Overview

Developed an interactive Power BI dashboard to analyze and visualize hotel revenue, booking trends, and operational metrics, enabling data-driven decision making for hotel management.

## Objective

Create comprehensive dashboards and analyses to track hotel KPIs (Key Performance Indicators) and identify business optimization opportunities related to revenue, bookings, and occupancy.

## Key Questions Answered

- What are the revenue trends across different time periods?
- How do bookings vary by property, room type, and season?
- What factors drive booking cancellations?
- How can revenue optimization strategies reduce lost revenue?

## Key Achievements

- Created a dynamic two-page dashboard for comprehensive hotel performance analysis
- Developed DAX measures to calculate key performance indicators (KPIs) and dynamic visuals
- Delivered actionable insights to optimize booking channels and marketing strategies
- Identified opportunities to reduce cancellations and improve occupancy rates

## Technologies Used

- **Power BI** - Interactive dashboarding and business intelligence
- **DAX (Data Analysis Expressions)** - Advanced calculated measures and metrics
- **Power Query** - Data transformation and ETL
- **Data Modeling** - Dimensional modeling for analytics

## Project Structure

```text
hotel-dashboard-analysis/
├── dashboard_files/
│   ├── hotel_dashboard.pbix           # Power BI project file
│   ├── data_model_diagram.png
│   └── dashboard_preview.png
├── Dax_Measures/                       # DAX measure definitions
│   ├── bookingsboard.dax              # Booking-related measures
│   ├── calendar.dax                   # Date/time calculations
│   ├── grossrevenue.dax               # Revenue before adjustments
│   ├── netrevenue.dax                 # Final revenue calculations
│   └── lostrevenue.dax                # Revenue loss analysis
├── data/                               # Source data
│   ├── bookings_data.csv
│   ├── calendar_dimension.csv
│   └── README.md                      # Data documentation
├── plots/                              # Dashboard screenshots
│   ├── revenue_dashboard.png
│   ├── bookings_analysis.png
│   └── kpi_summary.png
└── README.md                          # This file
```

## Key Metrics Tracked

### Primary KPIs

- **Gross Revenue**: Total revenue before deductions ($)
- **Net Revenue**: Final revenue after cancellations and adjustments ($)
- **Bookings**: Total number of reservations (#)
- **Lost Revenue**: Estimated revenue from cancellations ($)
- **Occupancy Rate**: Percentage of available rooms booked (%)

### Secondary Metrics

- **Average Daily Rate (ADR)**: Average revenue per occupied room
- **Cancellation Rate**: Percentage of bookings cancelled
- **Revenue per Available Room (RevPAR)**: Revenue optimization metric
- **Booking Trends**: Month-over-month and year-over-year comparisons

## Key Findings Summary

- **Revenue Patterns**: Peak revenue in [specific months], decline during [seasons]
- **Booking Behavior**: [X]% of bookings made [timeframe] in advance
- **Cancellation Impact**: [X]% cancellation rate results in $[amount] lost revenue
- **Property Performance**: [Top/Bottom] performing properties identified for targeted strategies
- **Seasonal Trends**: Clear seasonal patterns with [X]% variance between peak/off-season

## Dashboard Pages

1. **Revenue Board** - Overview of gross/net revenue with trends and comparisons
2. **Bookings Board** - Booking analysis, cancellation tracking, occupancy metrics
3. **KPI Summary** - Key metrics at a glance with drill-down capabilities

## How to Access

### View Live Dashboard

- 🔗 [Interactive Power BI Dashboard](https://app.powerbi.com/view?r=eyJrIjoiOWVhZTEwYTYtNmUzOS00MzcxLTkxMWQtODNlYWZjNGZmODYxIiwidCI6IjU5N2NlOTZmLWY2NzgtNDQ4YS1hNmE0LTAyZGJmYTUyMGQyYyJ9&embedImagePlaceholder=true)

### Run Locally

1. Download and install [Power BI Desktop](https://powerbi.microsoft.com/en-us/desktop/)
2. Open `hotel_dashboard.pbix` file
3. Refresh data connections (if using live data source)
4. Interact with visualizations and filters

### Integrate DAX Measures

1. Open Power BI Desktop project
2. Open Power Query Editor
3. Import DAX from respective files in `Dax_Measures/` folder
4. Paste into your model's Measure Table

## DAX Measures Explanation

### Gross Revenue (grossrevenue.dax)

```dax
-- Calculates total revenue before adjustments
SUMX(Bookings, Bookings[RoomRate] * Bookings[NumberOfNights])
```

### Net Revenue (netrevenue.dax)

```dax
-- Subtracts cancellations from gross revenue
[Gross Revenue] - [Lost Revenue]
```

### Lost Revenue (lostrevenue.dax)

```dax
-- Estimates revenue lost due to cancellations
SUMX(
  FILTER(Bookings, Bookings[Status] = "Cancelled"),
  Bookings[RoomRate] * Bookings[NumberOfNights]
)
```

### Bookings Board (bookingsboard.dax)

```dax
-- Comprehensive booking metrics
COUNTX(VALUES(Bookings[BookingID]), [BookingID])
```

### Calendar (calendar.dax)

```dax
-- Date-based calculations and aggregations
Useful for time-based analysis and comparisons
```

## Data Source & Size

- **Source**: Hotel operational database (Open Heaven Hotels case study)
- **Time Period**: [Specify date range]
- **Records**: ~[number] bookings analyzed
- **Tables**: Bookings, Customers, Rooms, Dates, Properties

## Methodology

- **Data Modeling**: Created star schema with fact and dimension tables
- **DAX Development**: Developed 20+ calculated measures for KPI tracking
- **Visualization Design**: Created intuitive, interactive dashboards for stakeholders
- **Performance Optimization**: Optimized queries for fast dashboard refresh
- **Trend Analysis**: Identified patterns and anomalies in booking/revenue data

## Strategic Recommendations

1. **Optimize Pricing**: Adjust rates based on demand patterns to increase revenue
2. **Reduce Cancellations**: Implement deposit/penalty strategies for high-cancellation periods
3. **Enhance Marketing**: Target marketing campaigns during low-occupancy periods
4. **Operational Efficiency**: Align staffing with predicted occupancy from forecasts

## Author

Rodrigue Z. Deguenon

## Date

July 2025

## Links

- 📊 [Interactive Dashboard](https://app.powerbi.com/view?r=eyJrIjoiOWVhZTEwYTYtNmUzOS00MzcxLTkxMWQtODNlYWZjNGZmODYxIiwidCI6IjU5N2NlOTZmLWY2NzgtNDQ4YS1hNmE0LTAyZGJmYTUyMGQyYyJ9&embedImagePlaceholder=true)
- 📄 [Full Report](../../documents/reports/hotel_dashboard_report.pdf)
