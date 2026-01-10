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
├── notebooks/
│   └── capstone-project-bellabeat.ipynb  # Main EDA notebook with full analysis
├── scripts/
│   └── bellabeat_script.R               # R analysis script
├── data/                                 # Data files
│   ├── daily_activity.csv              # Daily activity metrics
│   ├── sleep_day.csv                   # Sleep tracking data
│   └── hourlyIntensities_merged.csv    # Hourly intensity data
├── plots/                                # Generated visualizations
│   ├── activity_distribution.png
│   ├── intensity_by_time.png
│   ├── steps_vs_calories.png
│   ├── steps_vs_sedentary.png
│   ├── activity_vs_sleep.png
│   └── weekday_vs_weekend.png
├── reports/
│   └── bellabeat-report.pdf             # Comprehensive analysis report
├── requirements.txt                      # R package dependencies
└── README.md                             # Project documentation
```

## Key Findings Summary

### Activity Patterns

- **Step Distribution**: Right-skewed distribution with peak at 8,000-10,000 steps/day (average: 7,671 steps)
- **Peak Activity Times**: Highest intensity occurs 5-7 PM (17:00-19:00) with gradual decline after 7 PM
- **Weekday Consistency**: No significant difference between weekday and weekend activity levels
- **Steps-Calories Correlation**: Strong positive correlation between daily steps and calories burned
- **Activity Achievement**: Only ~2% of users meet WHO recommendation of 150 minutes weekly moderate activity

### Sleep & Sedentary Behaviors

- **Sleep Compliance**: 55% of users meet the recommended 7+ hours (420 minutes) of sleep per night
- **Sedentary-Activity Relationship**: Clear negative correlation—users with more steps have fewer sedentary minutes
- **Activity-Sleep Trade-off**: Weak negative correlation between activity level and sleep duration
- **Sleep Variability**: High variance in sleep patterns, indicating multiple influencing factors

### User Demographics & Participation

- **Study Population**: 33 participants in activity data, 24 in sleep data
- **Data Collection**: 936 daily activity observations, 410 sleep records, 22,099 hourly intensity records
- **Average Metrics**: 2,313 calories/day; 419 minutes average sleep (close to 420-minute recommendation)

## Data Source & Size

- **Source**: [FitBit Fitness Tracker Data](https://www.kaggle.com/datasets/arashnic/fitbit) via Kaggle
- **Collection Method**: Amazon Mechanical Turk survey respondents (Mobius)
- **Time Period**: December 3 - December 5, 2016
- **Participants**: 30 eligible Fitbit users who consented to data sharing
- **Datasets**:
  - Daily Activity: 936 records × 15 variables
  - Sleep Data: 410 records × 3 variables (after removing 3 duplicates)
  - Hourly Intensity: 22,099 records × 4 variables
- **Format**: CSV files with minute-level and daily aggregated outputs

## How to Reproduce

### Prerequisites

- R (version 3.6+)
- Jupyter Notebook or RStudio
- Libraries: tidyverse, lubridate, skimr, janitor, ggplot2

### Option 1: Run in Jupyter (Recommended)

```bash
# Navigate to project directory
cd bellabeat-analysis

# Install R kernel for Jupyter (if needed)
R -e "install.packages('IRkernel'); IRkernel::installspec()"

# Start Jupyter
jupyter notebook

# Open and run: notebooks/capstone-project-bellabeat.ipynb
```

### Option 2: Run in RStudio

1. Open RStudio
2. Install required packages:

   ```r
   install.packages(c("tidyverse", "lubridate", "skimr", "janitor"))
   ```

3. Open `scripts/bellabeat_script.R` or run cells from the notebook

### Option 3: Using R Command Line

```bash
# Run the analysis script
Rscript scripts/bellabeat_script.R
```

## Methodology

### Data Preparation

- Loaded three datasets from Fitbase export (daily activity, sleep, hourly intensity)
- Cleaned and validated data:
  - Removed 3 duplicate records from sleep data
  - Removed 4 observations with zero steps, distance, and calories (invalid data)
  - Converted date/time columns to appropriate formats
  - Standardized column names to lowercase
- Merged daily activity and sleep data on user ID and date (24 common participants)
- Converted numeric columns to integer types for analysis consistency

### Analysis Components

1. **Exploratory Analysis**: Summary statistics, distributions, and trend visualization
2. **Time-Series Analysis**: Hourly intensity patterns throughout the day
3. **Correlation Studies**: Activity-sleep, steps-calories, steps-sedentary relationships
4. **Comparative Analysis**: Weekday vs. weekend activity patterns
5. **Goal Achievement**: Percentage of users meeting WHO recommendations (150 min activity, 420 min sleep)
6. **Visualization**: Distribution plots, scatter plots with trend lines, time-series charts

## Files Reference

- **Main Analysis**: `notebooks/capstone-project-bellabeat.ipynb` - Complete Jupyter notebook with narrative analysis
- **R Script**: `scripts/bellabeat_script.R` - Standalone R analysis code
- **Visualizations**: See `plots/` folder for all generated charts and graphs
- **Report**: `reports/bellabeat-report.pdf` - Formal analysis report with findings and recommendations
- **Data Documentation**: Raw data files in `data/` folder with source information

## Author

Rodrigue Z. Deguenon

## Date

January 2025

## Links

- 🔗 [View on Kaggle](https://www.kaggle.com/code/rodriguedeguenon/capstone-project-bellabeat)
- 📄 [Full Report](./reports/bellabeat-report.pdf)
- 📊 [Jupyter Notebook](./notebooks/capstone-project-bellabeat.ipynb)
