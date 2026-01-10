# Exploratory Data Analysis: Bondora Peer-to-Peer Lending

## Project Overview

This project presents a comprehensive exploratory data analysis (EDA) of the Bondora peer-to-peer lending dataset, containing 409,951 loan records across 97 variables. The analysis employs descriptive statistics, data visualization, inferential hypothesis testing, and linear regression to examine factors influencing loan approval, interest rate determination, and borrower risk profiles. The work demonstrates core data analytics competencies including data cleaning, statistical testing, visualization, and explanatory modeling.

**Dataset Source**: [Bondora P2P Loans - Kaggle](https://www.kaggle.com/datasets/marcobeyer/bondora-p2p-loans)

## Objective

Uncover actionable insights into peer-to-peer lending patterns, risk pricing mechanisms, and demographic relationships within the Bondora platform through structured analysis of data structure, univariate/bivariate distributions, statistical hypothesis testing, and explanatory regression modeling.

## Key Research Questions

- What are the distributions of loan amounts, interest rates, and borrower demographics?
- How does Bondora's credit rating system relate to interest rate pricing?
- Are there gender-based differences in loan applications, approvals, or pricing?
- What is the relationship between applied and approved loan amounts?
- Which borrower characteristics indicate elevated default risk?
- How do loan characteristics vary geographically across the platform?

## Key Deliverables

- Comprehensive data exploration notebook with narrative and statistical rigor
- Univariate analysis of loan amounts, interest rates, durations, and borrower demographics
- Correlation analysis and multicollinearity assessment
- Statistical hypothesis testing (t-tests, ANOVA)
- Multiple regression models (interest rate determination, loan approval amounts)
- High-risk borrower identification and segmentation
- Professional visualizations (distributions, boxplots, heatmaps)
- Diagnostic assessment and model validation

## Technologies Used

- **Python 3.11** - Primary programming language
- **pandas** - Data manipulation and analysis
- **NumPy** - Numerical computing
- **matplotlib & seaborn** - Statistical data visualization
- **plotly** - Interactive visualizations
- **Jupyter Notebook** - Interactive analysis environment

## Project Structure

```text
bondora-loan-analysis/
├── loan_analysis.ipynb             # Main EDA notebook
├── data/                           # Data directory
│   ├── LoanData.csv               # Original Bondora dataset (409,951 records)
│   └── README.md                  # Data documentation
├── plots/                          # Generated visualizations
├── environment.yml                 # Conda environment specification
├── requirements.txt                # Python package dependencies
└── README.md                       # Project documentation
```

## Notebook Structure

The `loan_analysis.ipynb` is organized into five comprehensive parts:

### Part 1: Setup and Data Loading

- Library imports and configuration
- Selection of 18 analytical variables from 97-column dataset
- Data type conversion and strategic missing value imputation
- Initial data quality checks

### Part 2: Descriptive Analysis

- Summary statistics (mean, median, std, quartiles)
- Univariate distribution analysis:
  - Loan amounts (right-skewed, median ≈ 2,080 EUR)
  - Interest rates by credit rating (monotonic risk-based pricing)
  - Income distributions by gender
  - Geographic concentration (Estonia, Finland dominant)
  - Loan duration patterns
  - Loan status composition
- Bivariate correlation analysis (correlation matrix, heatmap)
- High-risk borrower identification (debt-to-income > 0.35 + employment tenure < 1 year)

### Part 3: Inferential Statistics

Hypothesis testing addressing four research questions:

- **H1**: Gender differences in applied loan amounts (t-test, p > 0.05, not significant)
- **H2**: Gender differences in approved loan amounts (t-test, p < 0.05, significant)
- **H3**: Gender differences in approval adjustment gaps (t-test, p > 0.05, not significant)
- **H4**: Interest rate variation across credit ratings (ANOVA, p < 0.001, highly significant)

### Part 4: Regression Analysis

**Model 1 - Interest Rate Determination**:

- Specification: Interest = β₀ + β₁×Income + β₂×Rating + ε
- R² = 0.605 (ratings explain 60.5% of rate variation)
- Finding: Credit ratings dominate interest pricing; income effect modest

**Model 2 - Loan Approval Amount**:

- Specification: Approved Amount = β₀ + β₁×Applied Amount + β₂×Income + ε
- R² = 0.93 (exceptional fit; 93% of variance explained)
- Finding: Approvals closely track requests (~93%); income acts as modest moderator

### Part 5: Synthesis and Conclusions

- Summary of key findings
- Limitations and qualifications
- Recommendations for future work
- Dataset-specific research extensions

## How to Use

### 1. Prerequisites

**Python Version**: 3.11+

**Required Packages**:

- pandas (data manipulation)
- numpy (numerical computing)
- matplotlib & seaborn (visualization)
- plotly (interactive plots)
- scipy & scikit-learn (statistical analysis)
- statsmodels (regression modeling)
- jupyter (notebook environment)

### 2. Setup Environment

#### Option A: Using Conda (Recommended)

```bash
# Create environment
conda create -n bondora python=3.11 pandas numpy matplotlib seaborn plotly scipy scikit-learn statsmodels jupyter

# Activate environment
conda activate bondora

# Start Jupyter
jupyter notebook
```

#### Option B: Using pip

```bash
# Create virtual environment
python -m venv venv
venv\Scripts\activate  # Windows

# Install packages
pip install pandas numpy matplotlib seaborn plotly scipy scikit-learn statsmodels jupyter

# Start Jupyter
jupyter notebook
```

### 3. Open and Run Analysis

```bash
# Navigate to project directory
cd bondora-loan-analysis

# Start Jupyter
jupyter notebook

# Open loan_analysis.ipynb
# Run cells sequentially (Shift + Enter) or all at once (Cell → Run All)
```

## Key Findings

### Loan Market Structure

- **Geographic Concentration**: Majority of loans originated in Estonia and Finland
- **Loan Amount Distribution**: Right-skewed distribution (median ≈ 2,080 EUR); most borrowers seek modest amounts
- **Loan Duration**: Clusters in 36–60 month range (standard medium-term consumer products)
- **Portfolio Composition**: Dataset dominated by "Repaid" loans; limits assessment of current default risk

### Risk-Based Pricing Model

- **Interest Rates by Rating**: Clear monotonic relationship—lower ratings (higher risk) face substantially higher rates
- **Regression Finding**: Credit ratings explain ~60.5% of interest rate variation (R² = 0.605)
- **Income Effect**: Statistically significant but economically modest negative effect on interest rates
- **Validation**: ANOVA test confirms highly significant differences in interest rates across ratings (F >> 1, p < 0.001)

### Loan Approval Mechanics

- **Applied vs. Approved**: Near-perfect correlation (r = 0.96); borrowers receive ~93% of requested amounts
- **Approval Model**: R² = 0.93 indicating strong structural determinism
- **Income Moderation**: Income has modest positive coefficient—higher-income borrowers receive marginally higher approvals
- **Implication**: Suggests effective pre-screening or confidence in borrower self-assessment

### Demographic Patterns

- **Gender Equity**: No significant difference in applied amounts (p > 0.05)
- **Approval Variation**: Slight but statistically significant difference in approved amounts by gender, though approval adjustment gaps do not differ (p > 0.05)
- **Income Similarity**: Gender distributions in income show comparable medians with right-skewness

### High-Risk Borrower Identification

- **Risk Criteria**: Debt-to-income ratio > 0.35 + employment tenure < 1 year
- **Prevalence**: ~15% of borrowers meet high-risk criteria
- **Profile**: Elevated debt service burden with employment instability

### Correlation Structure

- **Weak to Moderate Correlations**: Most variables exhibit weak interdependence
- **Low Multicollinearity**: Favorable for regression modeling
- **Implication**: Lending decisions incorporate multiple independent factors rather than single predictor dominance

## Analysis Methodology

### Data Preparation

- **Variable Selection**: 18 analytically relevant variables selected from 97-column dataset
- **Missing Data Strategy**:
  - Categorical employment duration: filled with "Unknown" category
  - Numeric history variables (prior loans): filled with 0 (new borrower indicator)
  - Gender: missing values coded as category 2 ("Unknown")
  - Credit ratings: excluded from rating-specific analyses when missing

### Statistical Methods

- **Descriptive Statistics**: Summary statistics, distributions, visualizations
- **Correlation Analysis**: Pearson correlations, heatmaps, multicollinearity assessment
- **Hypothesis Testing**:
  - Independent samples t-tests (gender effects, applied amounts, approval gaps)
  - One-way ANOVA (interest rates across ratings)
  - Significance level: α = 0.05
- **Regression Modeling**: Ordinary Least Squares (OLS) linear regression with diagnostic assessment

### Package Descriptions

| Package | Purpose |
| --------- | --------- |
| **pandas** | Data manipulation, cleaning, analysis |
| **numpy** | Numerical operations, arrays |
| **matplotlib** | Static visualization (histograms, boxplots, scatter plots) |
| **seaborn** | Statistical visualization (boxplots, heatmaps) |
| **plotly** | Interactive visualizations (if needed) |
| **scipy** | Statistical tests (t-tests, ANOVA, distributions) |
| **statsmodels** | Regression modeling, diagnostics, model summary |
| **scikit-learn** | Statistical utilities and preprocessing |
| **jupyter** | Interactive notebook environment |

## Important Limitations and Qualifications

### Data Characteristics

- **Temporal Scope**: Dataset heavily weighted toward "Repaid" loans suggests historical data rather than recent originations; limits assessment of current platform performance
- **Missing Ratings**: ~11% of observations lack credit ratings; excluded from rating-specific analyses
- **Geographic Focus**: Estonia and Finland dominate; findings may not generalize to other markets
- **Sample Composition**: Self-selected Bondora borrowers; patterns may not extend to traditional credit or excluded populations

### Methodological Constraints

- **Cross-Sectional Design**: Cannot establish causal relationships; analyzes associations only
- **Unobserved Confounders**: Credit history depth, loan purpose, collateral, borrower sophistication not captured
- **Linear Assumptions**: Nonlinear relationships or threshold effects not modeled
- **Risk Classification**: High-risk borrower thresholds arbitrary; not validated against actual defaults

### Model Qualifications

- **Regression Purpose**: Explanatory inference, not prediction; findings describe historical associations
- **Diagnostic Issues**: Modest departures from normality and heteroscedasticity noted; mitigated by large sample size (n > 400,000)
- **External Validity**: Bondora context-specific; may not generalize to other platforms or traditional banking

## Completed Analysis Checklist

- [x] Data loading and quality assessment completed
- [x] Missing value imputation with documented strategy
- [x] 18 analytically relevant variables selected and cleaned
- [x] Univariate analysis: all variables analyzed with distributions documented
- [x] Distribution plots: loan amounts, interest rates, income, geographic, duration, status
- [x] Summary statistics: all numeric variables documented
- [x] Correlation analysis: correlation matrix and heatmap generated
- [x] High-risk borrower segmentation: 15% identified via multifactorial criteria
- [x] Hypothesis tests: 4 research questions tested via t-tests and ANOVA
- [x] Regression modeling: 2 OLS models (interest rates, approval amounts)
- [x] Diagnostic assessment: residual plots, multicollinearity, normality evaluation
- [x] Key findings documented with interpretation and qualifications
- [x] Limitations explicitly stated with appropriate caveats
- [x] Future research directions identified

## Recommended Extensions and Future Work

### Temporal and Cohort Analysis

- Stratify by loan origination year to assess pattern evolution
- Assess whether findings generalize across time periods

### Default Risk Validation

- Link identified risk indicators (debt-to-income, employment duration) to actual defaults
- Calibrate high-risk classification thresholds against actual performance
- Conduct survival analysis or time-to-event modeling

### Geographic and Segment Analysis

- Compare patterns across full platform geography
- Assess region-specific lending dynamics
- Analyze segment-specific approval and pricing patterns

### Predictive Modeling

- Develop supervised learning models (logistic regression, ensemble methods)
- Predict loan performance and assess out-of-sample accuracy
- Compare explanatory models with predictive approaches

### Advanced Statistical Techniques

- Nonparametric or spline-based methods for nonlinear relationships
- Interaction effect testing (e.g., income effects by rating category)
- Multiple imputation for sensitivity analysis on missing ratings
- Quasi-experimental design exploiting policy changes or external shocks

### Debt Burden Analysis

- Incorporate existing liabilities and repayment history variables
- Develop comprehensive affordability assessment beyond income alone
- Analyze relationship between debt burden and approval/pricing decisions

### Borrower Experience Analysis

- Compare outcomes for first-time vs. repeat borrowers
- Assess whether repeat borrowing shows improved performance
- Identify progressive lending patterns

## Key Resources

- 📚 [Pandas Documentation](https://pandas.pydata.org/docs/)
- 📊 [Matplotlib Gallery](https://matplotlib.org/stable/gallery/index.html)
- 🔍 [Seaborn Examples](https://seaborn.pydata.org/examples.html)
- 📈 [Statsmodels Documentation](https://www.statsmodels.org/)
- 🤖 [Scikit-learn Guide](https://scikit-learn.org/stable/)
- 📖 [SciPy Stats Documentation](https://docs.scipy.org/doc/scipy/reference/stats.html)

## Author & Affiliation

### Rodrigue Z. Deguenon

Data Analytics Portfolio Project

## Project Date

January 2026

## Citation

If referencing this analysis, please cite:

Deguenon, R.Z. (2026). Exploratory Data Analysis: Bondora Peer-to-Peer Lending. Data Carpentry Portfolio Project.
