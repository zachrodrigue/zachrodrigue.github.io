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
├── cyclistic_analysis.Rmd          # Main R Markdown analysis
├── analysis_script.R               # R analysis script
├── cleaning_script.R               # Data cleaning and preprocessing
├── data/                            # Data files (cleaned and raw)
│   ├── raw_trips/                 # Original trip data
│   ├── processed_data.csv
│   └── README.md                  # Data documentation
├── plots/                           # Generated visualizations
│   ├── usage_patterns.png
│   ├── member_vs_casual.png
│   └── time_series_trends.png
├── requirements.txt               # R package dependencies
└── README.md                      # This file
```

## Key Findings Summary

- **Usage Patterns**: Casual riders use bikes more on weekends; members use consistently throughout the week
- **Trip Duration**: Casual riders take significantly longer trips on average (40+ min) vs members (~13 min)
- **Time Preferences**: Peak usage differs - members prefer commute hours, casual riders prefer afternoons/weekends
- **Seasonal Trends**: Usage is higher in warmer months for both segments; different seasonal curves
- **Starting Points**: Members use predictable routes; casual riders prefer tourist destinations and parks

## Data Source & Size

- **Source**: Cyclistic historical trip data (12-month period)
- **Time Period**: Covers full year including seasonal variations
- **Records**: ~5.7 million trips analyzed
- **Format**: CSV files with ride details (start/end times, stations, user type, bike type)

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

- **Data Cleaning**: Handled missing values, validated ride durations, removed outliers
- **Feature Engineering**: Created temporal features (day of week, hour, season)
- **Exploratory Analysis**: Distribution analysis, comparative visualizations, trend identification
- **Statistical Testing**: Hypothesis testing on usage differences
- **Visualization**: Created 15+ visualizations for stakeholder communication
- **Recommendations**: Developed actionable strategies based on findings

## Strategic Recommendations

1. **Target Marketing**: Focus casual riders on membership benefits that address their longer ride durations
2. **Seasonal Campaigns**: Create promotions during peak casual usage months
3. **Incentive Design**: Offer flexible pricing tiers appealing to casual rider patterns
4. **Digital Strategy**: Use location-based ads near popular casual rider destinations

## Files Reference

- **Analysis Report**: `cyclistic_analysis.Rmd` - Complete analysis with code and narrative
- **Tableau Dashboard**: Interactive visualizations for stakeholders
- **Visualizations**: Static plots in `plots/` folder
- **Data**: See `data/README.md` for data dictionary

## Author

Rodrigue Z. Deguenon

## Date

January 2025

## Links

- 📊 [Interactive Tableau Dashboard](https://public.tableau.com/app/profile/rodrigue.deguenon/viz/CyclisticBikeShareAnalysis_17374684424790/Dashboard1)
- 📄 [Full Report](../../documents/reports/cyclistic_report.pdf)
