/*
=========================================================
PROJECT TITLE : Financial Fraud Detection
CAPSTONE PROJECT

NAME          : Pragya Raghuwanshi
TOOLS USED    : Excel, MySQL, Python, Tableau

OBJECTIVE:
To analyze credit card transaction data and identify
fraudulent patterns, spending behavior, customer trends,
and geographical transaction insights using SQL.

DATASETS USED:
1. cc_data.csv
2. location_data.csv

=========================================================
*/

/*
====================================================
STEP 1: CREATE AND ACTIVATE SCHEMA
====================================================
Purpose:
Create the finance schema and set it as the default schema
for the Financial Fraud Detection project.
====================================================
*/

CREATE SCHEMA finance;
USE finance;

/*
====================================================
STEP 2: CREATE TRANSACTION DATA TABLE (cc_data)
====================================================
Purpose:
Create the main transaction table to store customer,
merchant, transaction amount, location, and fraud details.
====================================================
*/

CREATE TABLE finance.cc_data (
    idx INT,
    trans_date_trans_time VARCHAR(50),
    cc_num BIGINT,
    merchant VARCHAR(255),
    category VARCHAR(100),
    amt DECIMAL(10,2),
    first VARCHAR(100),
    last VARCHAR(100),
    gender VARCHAR(10),
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(10),
    zip INT,
    lat DECIMAL(10,6),
    longitude DECIMAL(10,6),
    city_pop INT,
    job VARCHAR(255),
    dob VARCHAR(20),
    trans_num VARCHAR(100),
    unix_time BIGINT,
    merch_lat DECIMAL(10,6),
    merch_longitude DECIMAL(10,6),
    is_fraud INT
);

/*
====================================================
STEP 3: CREATE LOCATION DATA TABLE (location_data)
====================================================
Purpose:
Create the location reference table containing
customer geographic information.
====================================================
*/


CREATE TABLE finance.location_data (
    cc_num BIGINT,
    lat DECIMAL(10,6),
    longitude DECIMAL(10,6)
);

/*
====================================================
STEP 4: IMPORT TRANSACTION DATA
====================================================
Purpose:
Load transaction records from cc_data.csv
into the cc_data table.
====================================================
*/

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cc_data.csv'
INTO TABLE finance.cc_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*
====================================================
STEP 5: IMPORT LOCATION DATA
====================================================
Purpose:
Load customer location records from location_data.csv
into the location_data table.
====================================================
*/

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/location_data.csv'
INTO TABLE finance.location_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*
====================================================
TASK 4.1: TOTAL NUMBER OF TRANSACTIONS
====================================================
Objective:
Calculate the total number of transactions in the
cc_data table.
====================================================
*/

SELECT COUNT(*) AS Total_Transactions
FROM finance.cc_data;

/*
Observation:
This query returns the total number of transaction
records available for fraud analysis.
*/

/*
====================================================
TASK 4.2: TOP 10 MOST FREQUENT MERCHANTS
====================================================
Objective:
Identify the top 10 merchants with the highest
number of transactions.
====================================================
*/

SELECT merchant,
       COUNT(*) AS Transaction_Count
FROM finance.cc_data
GROUP BY merchant
ORDER BY Transaction_Count DESC
LIMIT 10;

/*
Observation:
The result highlights the merchants with the
highest transaction frequency.
*/

/*
====================================================
TASK 4.3: AVERAGE TRANSACTION AMOUNT BY CATEGORY
====================================================
Objective:
Find the average transaction amount for each
transaction category.
====================================================
*/

SELECT category,
       ROUND(AVG(amt),2) AS Avg_Transaction_Amount
FROM finance.cc_data
GROUP BY category
ORDER BY Avg_Transaction_Amount DESC;

/*
Observation:
Different transaction categories exhibit varying
average spending patterns.
*/

/*
====================================================
TASK 4.4: FRAUDULENT TRANSACTIONS PERCENTAGE
====================================================
Objective:
Determine the number of fraudulent transactions
and their percentage of total transactions.
====================================================
*/

SELECT
COUNT(*) AS Fraudulent_Transactions,
ROUND(
(COUNT(*) * 100.0) /
(SELECT COUNT(*) FROM finance.cc_data),2
) AS Fraud_Percentage
FROM finance.cc_data
WHERE is_fraud = 1;

/*
Observation:
This query measures the prevalence of fraud
within the transaction dataset.
*/

/*
====================================================
TASK 4.5: JOIN TRANSACTION AND LOCATION DATA
====================================================
Objective:
Join cc_data and location_data tables to identify
latitude and longitude information.
====================================================
*/

SELECT
c.trans_num,
c.city,
l.lat,
l.longitude
FROM finance.cc_data c
INNER JOIN finance.location_data l
ON c.cc_num = l.cc_num
LIMIT 20;

/*
Observation:
The join enriches transaction records with
customer location information.
*/

/*
====================================================
TASK 4.6: CITY WITH HIGHEST POPULATION
====================================================
Objective:
Identify the city with the highest population.
====================================================
*/

SELECT city,
       city_pop
FROM finance.cc_data
ORDER BY city_pop DESC
LIMIT 1;

/*
Observation:
The result identifies the most populated city
present in the dataset.
*/

/*
====================================================
TASK 4.7: EARLIEST AND LATEST TRANSACTION DATE
====================================================
Objective:
Find the earliest and latest transaction dates.
====================================================
*/

SELECT
MIN(trans_date_trans_time) AS Earliest_Transaction,
MAX(trans_date_trans_time) AS Latest_Transaction
FROM finance.cc_data;

/*
Observation:
This query shows the time span covered by
the transaction records.
*/

/*
====================================================
TASK 5.1: TOTAL AMOUNT SPENT
====================================================
Objective:
Calculate the total amount spent across all
transactions.
====================================================
*/

SELECT ROUND(SUM(amt),2) AS Total_Amount_Spent
FROM finance.cc_data;

/*
Observation:
This represents the overall transaction value
recorded in the dataset.
*/

/*
====================================================
TASK 5.2: TRANSACTIONS BY CATEGORY
====================================================
Objective:
Count the number of transactions occurring
within each category.
====================================================
*/

SELECT category,
       COUNT(*) AS Total_Transactions
FROM finance.cc_data
GROUP BY category
ORDER BY Total_Transactions DESC;

/*
Observation:
The result shows which categories are most
frequently used by customers.
*/

/*
====================================================
TASK 5.3: AVERAGE TRANSACTION AMOUNT BY GENDER
====================================================
Objective:
Calculate average transaction amount for
each gender.
====================================================
*/

SELECT gender,
       ROUND(AVG(amt),2) AS Avg_Amount
FROM finance.cc_data
GROUP BY gender;

/*
Observation:
This helps compare spending behavior
between genders.
*/

/*
====================================================
TASK 5.4: DAY WITH HIGHEST AVERAGE TRANSACTION
AMOUNT
====================================================
Objective:
Identify the day of the week with the highest
average transaction amount.
====================================================
*/

SELECT
DAYNAME(
STR_TO_DATE(
SUBSTRING(trans_date_trans_time,1,10),
'%d-%m-%Y'
)
) AS Day_Name,
ROUND(AVG(amt),2) AS Avg_Amount
FROM finance.cc_data
GROUP BY Day_Name
ORDER BY Avg_Amount DESC;

/*
Observation:
This query reveals which day experiences
the highest average customer spending.
*/

/*
====================================================
SQL PROJECT CONCLUSION
====================================================

1. Successfully created and configured the
   finance schema.

2. Imported transaction and location datasets
   into MySQL.

3. Performed exploratory analysis on transaction,
   merchant, category, fraud, and location data.

4. Identified fraud-related patterns and customer
   transaction behavior using SQL queries.

5. Applied aggregation, filtering, joins, and
   statistical calculations to support fraud
   detection analysis.

The SQL analysis provides valuable insights into
transaction trends, customer behavior, merchant
activity, and fraudulent transaction patterns,
forming a strong foundation for fraud detection.
====================================================
*/