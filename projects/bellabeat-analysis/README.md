# Bellabeat Data Analysis

## Project Overview

Conducted an exploratory data analysis (EDA) on fitness data from non-Bellabeat devices to identify user trends, informing Bellabeat's product development and marketing strategies to enhance customer engagement.

## Objective

Analyze smart device fitness data to uncover trends in device usage and user behavior patterns, providing strategic recommendations for product innovation and targeted marketing campaigns.

## Key Questions Answered

- How do different customer segments use fitness devices?
- What are the daily activity, sleep, and intensity patterns?
- What are the peak usage times and user engagement drivers?
- How can insights inform product development and marketing?

## Key Achievements

- Analyzed daily activity, sleep, and intensity data to uncover key user behaviors
- Identified peak usage times and recommended personalized marketing campaigns
- Proposed new features for Bellabeat's app to improve user retention and satisfaction

## Technologies Used

- **R** - Data analysis and statistical computing
- **ggplot2** - Data visualization and graphics
- **tidyverse** - Data manipulation (dplyr, tidyr)
- **R Markdown** - Literate programming and reporting
- **Kaggle** - Data source

## Project Structure

```text
bellabeat-analysis/
├── bellabeat_analysis.Rmd      # Main R Markdown analysis document
├── bellabeat_script.R          # R analysis script
├── data/                        # Data files
│   ├── daily_activity.csv
│   ├── sleep_day.csv
│   ├── heart_rate_seconds.csv
│   └── README.md               # Data documentation
├── plots/                       # Generated visualizations (PNG/SVG)
│   ├── activity_distribution.png
│   ├── sleep_patterns.png
│   └── user_segments.png
├── requirements.txt            # R package dependencies
└── README.md                   # This file
```

## Key Findings Summary

- **Usage Distribution**: Identified three main user segments based on daily activity levels (sedentary, lightly active, very active)
- **Sleep Patterns**: Found correlation between activity levels and sleep duration
- **Peak Times**: Weekday patterns show highest activity in early morning and evening hours
- **Device Engagement**: Certain features show significantly higher engagement among premium users

## Data Source & Size

- **Source**: Kaggle Bellabeat Fitness Tracking Data
- **Time Period**: March - May 2016
- **Records**: ~940 million rows across multiple tables
- **Format**: CSV files (daily aggregates and raw records)

## How to Reproduce

### Option 1: Using R

```r
# Install required packages
install.packages(c("tidyverse", "ggplot2", "dplyr", "lubridate"))

# Run the analysis
rmarkdown::render("bellabeat_analysis.Rmd")
```

### Option 2: Using RStudio

1. Open `bellabeat_analysis.Rmd` in RStudio
2. Click "Knit" to generate HTML report with all visualizations

## Methodology

- **Data Cleaning**: Handled missing values and outliers
- **Exploratory Analysis**: Distribution analysis, correlation studies
- **Segmentation**: User clustering based on activity patterns
- **Visualization**: Time-series trends, comparative visualizations
- **Recommendations**: Strategic insights based on findings

## Files Reference

- **Main Report**: `bellabeat_analysis.Rmd` - Comprehensive analysis with narrative
- **Visualizations**: See `plots/` folder for all generated graphics
- **Data**: See `data/README.md` for detailed data dictionary

## Author

Rodrigue Z. Deguenon

## Date

January 2025

## Links

- 🔗 [View on Kaggle](https://www.kaggle.com/code/rodriguedeguenon/capstone-project-bellabeat)
- 📄 [Full Report](../../documents/reports/bellabeat-report.pdf)
