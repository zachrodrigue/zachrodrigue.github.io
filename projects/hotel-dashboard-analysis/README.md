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
├── data/
│   ├── Datatable.txt                 # Raw booking data (92,000 rows)
│   └── hotel_reservations_data_dictionary.csv  # Data documentation
├── Dax_Measures/                       # DAX measure definitions
│   ├── bookingsboard.dax              # Booking-related measures
│   ├── calendar.dax                   # Date/time calculations
│   ├── grossrevenue.dax               # Revenue before adjustments
│   ├── netrevenue.dax                 # Final revenue calculations
│   └── lostrevenue.dax                # Revenue loss analysis
├── plots/                              # Dashboard screenshots and exports
├── reports/                            # Analysis reports
└── README.md                           # This file
```

## Key Metrics Tracked

### Primary KPIs (2024 Data)

- **Gross Revenue**: $102.7M total revenue before cancellations
- **Net Revenue**: $80.01M revenue after cancellations (78% net rate)
- **Lost Revenue**: $22.69M (22.1% of gross revenue)
- **Total Bookings**: 38,000 reservations
- **Cancellations**: 9,000 cancelled bookings (23.7% cancellation rate)

### Secondary Metrics

- **Lost Revenue Reduction**: 63% improvement YoY (from $61.29M to $22.69M)
- **Revenue Recovery Rate**: 13.1% increase in net revenue despite lower bookings
- **Top Revenue Method**: Cash payments (63.8% net rate); slight advantage over cards
- **Seasonal Variation**: Summer (7,000 cancellations) to Autumn (10,000 cancellations)
- **Geographic Performance**: 65.7% net rate in Egypt; 37.9% lost rate in Greece

## Key Findings Summary

### Revenue Performance: Strong Recovery

- **2023**: Gross Revenue $131.99M, Lost Revenue $61.29M (46.4%), Net Revenue $70.7M
- **2024**: Gross Revenue $102.7M, Lost Revenue $22.69M (22.1%), Net Revenue $80.01M
- **Year-over-Year Improvement**: Lost Revenue decreased 63% YoY; Net Revenue grew 13.1% despite lower gross revenue
- **Payment Method Performance**: Cash (63.8% net rate), Bank Transfer (63.6%), Credit Card (63.5%)
- **Geographic Leaders**: Egypt highest net revenue rate (65.7%), Greece highest lost revenue (37.9%)

### Booking Trends: Volume Down, Efficiency Up

- **Total Bookings**: 49,000 (2023) → 38,000 (2024), 22.5% decrease
- **Cancellations**: 24,000 (2023) → 9,000 (2024), 62.5% improvement
- **Peak Check-in Months**: June (5,312 check-ins), July (5,613 check-ins) — summer travel season
- **Peak Cancellation Months**: December (3,502), November (3,425) — holiday season challenges
- **Cancellations by Season**: Autumn (10,000), Spring (9,000), Winter (8,000), Summer (7,000)

### Strategic Insights

- Operational improvements significantly reduced lost revenue despite lower booking volume
- Booking channels show nearly equal net/lost revenue, indicating friction in conversion process
- Q4 cancellations represent opportunity for targeted retention strategies and seasonal offers
- Geographic patterns suggest market-specific booking challenges requiring regional analysis

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

- **Source**: Open Heaven Hotels sample reservations data (Data with Decision)
- **Time Period**: 2023 & 2024 (24 months of operations)
- **Records**: 92,000 total booking transactions analyzed
- **Features**: 24 columns including: BookingDate, CheckinDate, CheckoutDate, Status, RoomType, Payment Method, Nationality, BookingChannel, RoomRate, NumberOfNights
- **Data Quality**: Cleaned and standardized using Power Query; duplicates removed, data types validated

## Methodology

- **Data Modeling**: Created star schema with fact and dimension tables
- **DAX Development**: Developed 20+ calculated measures for KPI tracking
- **Visualization Design**: Created intuitive, interactive dashboards for stakeholders
- **Performance Optimization**: Optimized queries for fast dashboard refresh
- **Trend Analysis**: Identified patterns and anomalies in booking/revenue data

## Strategic Recommendations

### 1. Reduce Cancellations in Q4 (Top Priority)

- November-December see peak cancellations (6,927 combined)
- Implement deposit/penalty structures or incentive programs for high-risk periods
- Send reminder communications 48-72 hours before check-in
- Consider non-refundable rate options with 10-15% discount

### 2. Address Regional Booking Friction

- Greece shows 37.9% lost revenue rate — investigate booking process barriers
- Equal net/lost revenue across channels suggests conversion issues
- A/B test simplified booking flows and expanded payment options by geography
- Prioritize high-loss channels for process optimization

### 3. Maximize Summer Peak Season (June-July)

- June (5,312) and July (5,613) check-ins represent peak demand
- Increase rates 15-20% during these months to capture demand
- Allocate marketing budget to drive bookings 6-8 weeks in advance
- Cross-sell premium room types and add-on services during peak season

### 4. Boost Off-Season Revenue (February-May)

- Implement targeted promotional campaigns during shoulder months
- Use dynamic pricing to stimulate bookings when occupancy is low
- Create package deals combining rooms with experiences or services
- Focus marketing efforts on low-performing regions during these periods

## Author

Rodrigue Z. Deguenon

## Date

July 2025

## Links

- 📊 [Interactive Dashboard](https://app.powerbi.com/view?r=eyJrIjoiOWVhZTEwYTYtNmUzOS00MzcxLTkxMWQtODNlYWZjNGZmODYxIiwidCI6IjU5N2NlOTZmLWY2NzgtNDQ4YS1hNmE0LTAyZGJmYTUyMGQyYyJ9&embedImagePlaceholder=true)
- 📄 [Full Report](./reports/hotel_dashboard_report.pdf)
