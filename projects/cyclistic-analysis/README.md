# Cyclistic Bike Share Analysis

## Project Overview

Conducted a comprehensive analysis of Cyclistic's bike-sharing data to identify differences in usage patterns between casual and annual members. The insights informed marketing strategies to convert casual riders to annual members.

## Objective

Analyze 12 months of bike-sharing trip data to understand how annual members and casual riders use Cyclistic bikes differently, and develop data-driven strategies to convert casual riders to membership.

## Key Questions Answered

- How do annual members and casual riders use Cyclistic bikes differently?
- Why would casual riders buy Cyclistic annual memberships?
- How can digital media be leveraged to influence casual riders to become members?
- What are the key behavioral differences and engagement patterns?

## Key Achievements

- Analyzed 12 months of bike-sharing data to identify key differences between user types
- Identified peak usage times and recommended targeted marketing campaigns
- Proposed incentives and strategies to encourage casual riders to become annual members
- Created interactive visualizations on Tableau for executive stakeholder engagement

## Technologies Used

- **R** - Data analysis, cleaning, and statistical computing
- **Tableau** - Interactive dashboard and business intelligence visualization
- **tidyverse/dplyr** - Data manipulation and transformation
- **ggplot2** - Static visualization and exploratory plots

## Project Structure

```text
cyclistic-analysis/
├── analysis_script.R                # R analysis script
├── cleanig_script.R                # Data cleaning and preprocessing
├── data/                            # Data files
│   ├── raw_trips/                   # Original monthly CSV files (12 months of 2024)
│   ├── processed_data.csv            # Cleaned and processed dataset
│   └── README.md                     # Data documentation
├── reports/
│   └── cyclistic_report.pdf           # Comprehensive analysis report
├── requirements.txt                 # R package dependencies
└── README.md                        # Project documentation
```

## Key Findings Summary

### Ride Volume & Duration

- **Total Casual Rides**: 2,080,193 (36% of total)
- **Total Annual Rides**: 3,641,355 (64% of total)
- **Average Casual Ride Duration**: 21.5 minutes (leisure/longer trips)
- **Average Annual Ride Duration**: 12.4 minutes (utilitarian/commuting)
- **Key Insight**: Casual riders take 73% longer trips on average

### Usage Patterns by Day & Time

- **Casual Riders**: Most active on **Saturdays** with peak at **5 PM**; indicate weekend/leisure focus
- **Annual Members**: Most active on **Wednesdays** with peak at **5 PM**; indicate weekday commuting
- **Weekly Pattern**: Casual riders prefer weekends; annual members prefer weekdays
- **Commute Hypothesis**: Annual members show rush hour peaks (morning & evening); casual riders show midday/evening peaks

### Seasonal & Geographic Insights

- **Seasonality**: Casual members show higher usage in warmer months (spring/summer) indicating seasonal leisure use; annual members have consistent year-round usage
- **Popular Casual Stations**: Leisure/tourist locations (e.g., Streeter Dr & Grand Ave)
- **Popular Annual Stations**: Business districts and transit hubs (e.g., Clinton St & Washington Blvd)
- **Bike Type Preference**: Casual riders prefer electric bikes; annual members show no strong preference

### Data Quality

- **Records Analyzed**: 5.7 million trips
- **Data Period**: Full year 2024 (12 monthly files)
- **Data Fields**: 13 columns including ride_id, rideable_type, start/end times, stations, coordinates, member status

## Data Source & Size

- **Source**: Motivate International Inc. bike-share data
- **Time Period**: Full year 2024 (January - December)
- **Data Format**: 12 monthly CSV files
- **Total Records**: 5.7 million bike trips analyzed
- **Data Columns**: ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
- **License**: Motivate International Inc. [License Agreement](https://divvybikes.com/data-license-agreement)
- **Bike Types**: Classic bikes, electric bikes

## How to Reproduce

### Option 1: Run R Markdown

```r
# Install required packages
install.packages(c("tidyverse", "ggplot2", "lubridate", "skimr"))

# Render the analysis report
rmarkdown::render("cyclistic_analysis.Rmd")
```

### Option 2: Run Cleanup & Analysis Scripts

```bash
# First run cleaning
Rscript cleaning_script.R

# Then run analysis
Rscript analysis_script.R
```

### Option 3: View Interactive Dashboard

Open the [Tableau Dashboard](https://public.tableau.com/app/profile/rodrigue.deguenon/viz/CyclisticBikeShareAnalysis_17374684424790/Dashboard1)

## Methodology

### Data Cleaning & Preparation

- **Missing Value Handling**: Removed rows with missing values in critical columns (ride_id, started_at, ended_at, member_casual)
- **Duplicate Removal**: Eliminated duplicate rows based on ride_id
- **Data Validation**: Ensured ended_at is always later than started_at; removed invalid time sequences
- **Station Data**: Filtered out rows with empty or invalid station names

### Feature Engineering

- **Ride Duration**: Calculated as difference between ended_at and started_at (in minutes)
- **Temporal Features**: Extracted day_of_week, hour_of_day, and month from started_at for pattern analysis
- **Seasonality Indicators**: Grouped by month to identify seasonal trends

### Analysis & Visualization

- **Comparative Analysis**: Compared casual vs annual member behavior across duration, frequency, timing
- **Temporal Patterns**: Analyzed peak usage by hour, day of week, and month
- **Geographic Analysis**: Identified popular start stations for each member type
- **Bike Type Analysis**: Compared bike type preferences between casual and annual members
- **Statistical Summary**: Calculated key metrics (mean, mode, distribution) for each segment
- **Dashboard Creation**: Built interactive Tableau visualizations for stakeholder communication

## Strategic Recommendations

### 1. Targeted Marketing Campaigns

- **Focus on Casual Riders with Commute Patterns**: Target the casual riders who use bikes during peak commuting hours (morning/evening) or at weekday stations
- **Cost Savings Messaging**: Highlight annual membership savings for frequent riders (casual riders average 21.5 min/trip, showing significant potential usage)
- **High-Value Casual Segment**: Concentrate efforts on casual riders at business district stations who show commuting behavior

### 2. Promotional Timing & Incentives

- **Seasonal Campaigns**: Launch membership promotions during warmer months (spring/summer) when casual rider activity peaks
- **Weekend-to-Weekday Conversion**: Offer trial memberships targeting Saturday riders (casual peak day) to encourage weekday commuting
- **Incentive Design**: Create flexible pricing tiers that appeal to casual rider patterns (e.g., monthly passes for leisure users transitioning to commuters)

### 3. Bike Allocation & Service Strategy

- **Electric Bike Availability**: Increase electric bike inventory at popular casual-rider stations during peak leisure hours (5 PM, weekends)
- **Station-Based Targeting**: Allocate classic bikes to business district stations for annual members; electric bikes to leisure locations for casual riders
- **Seasonal Adjustments**: Pre-position more bikes at popular casual stations during warmer months

### 4. Digital & Location-Based Marketing

- **Geographic Targeting**: Use location-based ads at popular casual stations (Streeter Dr & Grand Ave) to promote membership benefits
- **Tourist District Campaigns**: Develop messaging that emphasizes cost-effectiveness and convenience for casual riders at leisure destinations
- **Time-Based Messaging**: Target ads during peak casual usage hours (5 PM, weekends) with conversion-focused messaging

## Files Reference

- **Analysis Report**: `reports/cyclistic_report.pdf` - Comprehensive analysis with findings and recommendations
- **R Scripts**:
  - `analysis_script.R` - Main analysis code
  - `cleanig_script.R` - Data cleaning and preprocessing
- **Interactive Dashboard**: [Tableau Dashboard](https://public.tableau.com/app/profile/rodrigue.deguenon/viz/CyclisticBikeShareAnalysis_17374684424790/Dashboard1)
- **Visualizations**: See `plots/` folder for all generated charts including ride duration comparison, weekly patterns, peak times, seasonality, and popular stations
- **Data**: See `data/Data_Link.txt` for detailed data dictionary and sources

## Author

Rodrigue Z. Deguenon

## Date

January 2025

## Links

- 📊 [Interactive Tableau Dashboard](https://public.tableau.com/app/profile/rodrigue.deguenon/viz/CyclisticBikeShareAnalysis_17374684424790/Dashboard1)
- 📄 [Full Report](./reports/cyclistic_report.pdf)

## References

- Motivate International Inc. Bike Share Data. [License Agreement](https://divvybikes.com/data-license-agreement)
