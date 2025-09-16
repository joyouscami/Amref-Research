MSM HIV Services Analysis – Embu County
📌 Project Overview

This project investigates the barriers and facilitators to accessing HIV services among men who have sex with men (MSM) in Embu County, Kenya. The study uses both descriptive and inferential statistical methods in R to evaluate service uptake, satisfaction levels, and the role of community-based organizations in HIV prevention.

The dataset includes information on age, sub-county, HIV program enrollment status, and satisfaction rates, with additional qualitative insights from focus groups.

🎯 Objectives

Assess the effects of MSM-affiliated community-based organizations on HIV prevention uptake.

Investigate factors related to stigma reduction and discrimination.

Explore satisfaction levels with HIV services across sub-counties and age groups.

Identify underlying factors (via Factor Analysis) that influence service utilization.

🛠️ Methods & Analyses Performed

Descriptive Statistics: Age distributions, enrollment status, satisfaction levels.

Chi-Square Test: Association between sub-county and satisfaction rate.

Independent Samples T-test: Compare satisfaction between enrolled vs. non-enrolled participants.

ANOVA: Test differences in satisfaction across sub-counties and age groups.

Logistic Regression: Predict likelihood of HIV program enrollment.

Factor Analysis: Identify latent factors influencing MSM HIV service satisfaction and uptake.

📂 Project Structure
├── data/
│   └── atlo_research_data.csv   # Cleaned dataset
├── scripts/
│   ├── 01_data_cleaning.R
│   ├── 02_descriptive_analysis.R
│   ├── 03_inferential_tests.R
│   ├── 04_factor_analysis.R
│   └── utils.R
├── results/
│   ├── descriptive_stats.csv
│   ├── anova_results.csv
│   ├── logistic_regression_output.txt
│   └── factor_analysis_loadings.csv
├── OUTPUT.pdf   # SPSS output used for triangulation
├── README.md
└── requirements.txt   # R package dependencies

📦 Dependencies

Install the required R packages before running the scripts:

install.packages(c("tidyverse", "psych", "GPArotation", "car", "broom"))

▶️ How to Run the Analysis

Clone the repository:

git clone https://github.com/yourusername/msm-hiv-analysis.git
cd msm-hiv-analysis


Open R or RStudio and run the scripts in sequence (01_data_cleaning.R → 04_factor_analysis.R).

Outputs (tables, plots, regression summaries) will be saved in the results/ folder.

📊 Key Findings

Satisfaction levels vary significantly across sub-counties.

Enrollment status alone does not fully explain satisfaction differences.

Age is significantly associated with satisfaction levels.

Two latent factors explain ~58% of variance:

Regional variations (Sub-county influence)

Program enrollment status

🚀 Future Work

Incorporate qualitative findings (focus group themes).

Build interactive dashboards (Shiny or Power BI).

Expand analysis with longitudinal data.

🧑‍🤝‍🧑 Acknowledgments

This project was conducted in collaboration with ATLO, a key-population-led community-based organization in Embu County. Special thanks to MSM community members who participated in the study.

📜 License

This project is licensed under the MIT License – see the LICENSE file for details.
