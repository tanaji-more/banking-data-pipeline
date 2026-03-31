-- STEP 3: DATABASE & SCHEMA SETUP
-- =========================================================


CREATE DATABASE IF NOT EXISTS bank_data;

USE DATABASE bank_data;

CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS warehouse;


-- STEP 4: FILE FORMAT (CSV)
-- =========================================================

CREATE OR REPLACE FILE FORMAT csv_format
TYPE = 'CSV'
FIELD_DELIMITER = ','
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
SKIP_HEADER = 1;


-- STEP 5: RAW TABLE CREATION (NO TRANSFORMATION)
-- =========================================================

USE SCHEMA raw;

CREATE OR REPLACE TABLE bank_data (
    customer_id STRING,
    first_name STRING,
    last_name STRING,
    age INT,
    gender STRING,
    address STRING,
    city STRING,
    contact_number STRING,
    email STRING,
    account_type STRING,
    account_balance FLOAT,
    account_open_date DATE,
    last_transaction_date DATE,
    transaction_id STRING,
    transaction_date TIMESTAMP,
    transaction_type STRING,
    transaction_amount FLOAT,
    balance_after FLOAT,
    branch_id STRING,
    loan_id STRING,
    loan_amount FLOAT,
    loan_type STRING,
    interest_rate FLOAT,
    loan_term INT,
    loan_decision_date DATE,
    loan_status STRING,
    card_id STRING,
    card_type STRING,
    credit_limit FLOAT,
    credit_balance FLOAT,
    min_payment FLOAT,
    payment_due_date DATE,
    last_payment_date DATE,
    reward_points INT,
    feedback_id STRING,
    feedback_date DATE,
    feedback_type STRING,
    resolution_status STRING,
    resolution_date DATE,
    anomaly STRING
);


-- STEP 6: LOAD DATA FROM S3 INTO RAW TABLE
-- =========================================================

COPY INTO bank_data
FROM @public.s3_stage/Banking_Database.csv
FILE_FORMAT = csv_format;


-- VERIFY DATA LOAD
-- =========================================================

SELECT * FROM bank_data LIMIT 10;