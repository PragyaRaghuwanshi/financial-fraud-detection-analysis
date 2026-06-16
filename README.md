# Financial Fraud Detection and Transaction Analysis

## Project Overview

This capstone project focuses on identifying fraud patterns, analyzing transaction behavior, and exploring customer spending trends using financial transaction data. The project combines Excel, SQL, Python, and Tableau to perform end-to-end analytics, from data exploration and fraud analysis to interactive dashboard development.

The objective is to support fraud monitoring, risk assessment, and business decision-making by uncovering transaction patterns, fraud-prone categories, geographical fraud concentrations, and spending behavior across customer segments.

---

## Business Problem

Financial institutions process millions of transactions daily, making manual fraud detection difficult and inefficient. Organizations require data-driven approaches to identify suspicious activities, monitor fraud patterns, understand customer transaction behavior, and improve risk management processes.

This project addresses these challenges through exploratory analysis, SQL-based business analysis, Python EDA, and interactive Tableau dashboards.

---

## Tools & Technologies

* Microsoft Excel
* MySQL
* Python

  * Pandas
  * NumPy
  * Matplotlib
  * Seaborn
* Tableau

---

## Dataset Information

The project utilized two datasets:

### cc_data.csv

Contains:

* Transaction Date and Time
* Credit Card Information
* Merchant Details
* Transaction Category
* Transaction Amount
* Customer Demographics
* Fraud Indicator

### location_data.csv

Contains:

* Credit Card Number
* Latitude
* Longitude

Dataset Size:

* Approximately 389,000 transaction records

---

## Project Files

| File Name                                                     | Description                                                                                                               |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Financial_Fraud_Detection_SQL(1).sql                          | SQL queries for transaction analysis, fraud analysis, category analysis, geographic analysis, and business reporting      |
| Financial_Fraud_Detection_Python(3).ipynb                     | Python Exploratory Data Analysis (EDA), statistical analysis, fraud detection analysis, trend analysis, and visualization |
| Financial_Fraud_Detection_Tableau.twbx                        | Interactive Tableau dashboard for transaction monitoring and fraud analysis                                               |
| Writeup_Financial_Fraud_Detection_Pragya_Raghuwanshi.docx     | Detailed project report, methodology, analysis process, and business insights                                             |
| Screenshot__Financial_Fraud_Detection_Pragya_raghuwanshi.docx | Complete screenshots of Excel, SQL, Python, and Tableau outputs used throughout the project                               |

### Note About Excel File

The original Excel workbook (**Financial_Fraud_Detection_Excel_Analysis.xlsx**) exceeded GitHub's file size limit and could not be uploaded to this repository.

However, all Excel analysis outputs, charts, pivot tables, and findings have been preserved in:

```text
Screenshot__Financial_Fraud_Detection_Pragya_raghuwanshi.docx
```

This screenshot document contains complete visual evidence of all Excel tasks, outputs, charts, and analysis performed during the project.

---

## Excel Analysis

The Excel phase focused on exploratory analysis and fraud pattern identification.

### Tasks Performed

* Data exploration and profiling
* Statistical summary analysis
* Transaction amount distribution analysis
* Fraud distribution by gender and category
* Top transaction states analysis
* Correlation analysis between transaction amount and city population
* Fraud category analysis
* Average transaction amount by occupation analysis

### Key Findings

* Transaction amounts displayed significant variation across customers.
* Transaction amount and city population showed almost no correlation.
* Fraudulent transactions were concentrated in shopping and grocery-related categories.
* Texas, New York, and Pennsylvania recorded the highest transaction volumes.
* Customer spending behavior varied significantly across occupations.
* High-value transactions were relatively rare compared to low-value transactions.

Excel screenshots and outputs are available in the screenshot document included in this repository.

---

## SQL Analysis

### Tasks Performed

* Total transaction count analysis
* Top merchant analysis
* Average transaction amount by category
* Fraud percentage calculation
* Transaction and location data integration
* Population-based analysis
* Date trend analysis
* Category-level aggregation
* Gender-based transaction analysis

### Key Insights

* Fraud transactions represented a very small percentage of total transactions.
* Shopping and grocery categories generated significant transaction volume.
* Geographic transaction clusters were identified.
* Transaction behavior differed across customer segments and categories.

---

## Python Analysis

### Tasks Performed

* Data loading and cleaning
* Missing value analysis
* Descriptive statistics
* Distribution analysis
* Correlation analysis
* Fraud category analysis
* Time trend analysis
* Outlier detection
* Data quality checks
* Group-wise numerical analysis
* Fraud influencing factor analysis

### Key Insights

* Fraud cases were highly imbalanced compared to legitimate transactions.
* Transaction values showed substantial variation.
* Certain categories demonstrated higher transaction values.
* Seasonal and weekly transaction patterns were identified.
* Inflation-adjusted analysis provided additional business context.

---

## Tableau Dashboard

### Dashboard Components

* Transaction Amount Distribution by Gender and Category
* Geographical Distribution of Transactions
* Fraud Map
* Monthly Transaction Trend
* Weekly Inflation-Adjusted Transaction Trend

### Dashboard Features

* Gender Filter
* Category Filter
* Transaction Amount Filter
* Interactive Cross Filtering
* Geographic Exploration
* Dynamic Fraud Investigation

---

## Key Business Insights

* Fraudulent transactions represent a small but critical portion of overall transaction activity.
* Shopping and grocery-related categories exhibited higher fraud occurrence.
* Customer spending behavior varies significantly across transaction categories.
* Geographic analysis helps identify fraud-prone regions.
* Transaction activity demonstrates seasonal and weekly fluctuations.
* Inflation-adjusted transaction analysis provides deeper insight into spending behavior.
* Interactive dashboards improve fraud monitoring and investigation capabilities.

---

## Project Outcome

This project demonstrates end-to-end analytics capabilities using Excel, SQL, Python, and Tableau to transform raw financial transaction data into actionable fraud detection insights. The findings support fraud monitoring, transaction analysis, risk management, and strategic decision-making for financial institutions.
