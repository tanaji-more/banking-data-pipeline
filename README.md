# Banking Data Pipeline using Snowflake & AWS S3

## 📌 Overview

This project demonstrates an end-to-end data engineering pipeline using AWS S3 and Snowflake. The pipeline processes banking data including customers, transactions, loans, credit cards, and fraud detection.

## 🏗️ Architecture

* Data Source → AWS S3
* Snowflake External Stage
* Raw Layer → Staging Layer → Warehouse Layer
* Dashboard using Snowflake Snowsight

## 🏗️ Architecture Overview

This project follows a modern data engineering architecture:

1. **Data Source**

   * Raw banking dataset (CSV file)

2. **AWS S3 (Data Lake Layer)**

   * Stores raw data files
   * Acts as staging storage before ingestion

3. **Snowflake External Stage**

   * Connects Snowflake with S3 using storage integration
   * Enables secure data access

4. **Raw Layer (Snowflake)**

   * Data loaded using COPY INTO
   * No transformation applied

5. **Staging Layer**

   * Data cleaning and transformation
   * Null handling and type casting

6. **Warehouse Layer**

   * Star schema design
   * Fact and dimension tables

7. **Performance Optimization**

   * Clustering on transaction date

8. **Data Governance**

   * Role-based access control
   * Masking policies

9. **Visualization**

   * Dashboards created using Snowflake Snowsight


## ⚙️ Technologies Used

* AWS S3
* Snowflake
* SQL
* Data Modeling (Star Schema)

## 🚀 Features:

* Data ingestion from S3 using external stage
* Data cleaning and transformation (ELT)
* Fact and Dimension table design
* Performance optimization using clustering
* Fraud detection using anomaly column
* Dashboard creation in Snowflake

## 📊 Key Insights

* Monthly transaction trends
* Customer segmentation
* Loan approval analysis
* Fraud detection

## 🔐 Data Governance

* Role-based access control
* Masking policies
  
## 🧠 Learnings

* End-to-end data pipeline design
* Snowflake performance tuning
* Real-world banking data modeling
