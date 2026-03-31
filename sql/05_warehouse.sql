
-- STEP 8: DATA WAREHOUSE DESIGN (STAR SCHEMA)
-- =========================================================

USE DATABASE bank_data;
USE SCHEMA warehouse;

-- CUSTOMER DIMENSION TABLE
-- =========================================================

CREATE OR REPLACE TABLE dim_customers AS
SELECT DISTINCT
    customer_id,
    city,
    account_type
FROM bank_data.staging.stg_bank_data;


-- TRANSACTION FACT TABLE
-- =========================================================

CREATE OR REPLACE TABLE fact_transactions AS
SELECT
    transaction_id,
    customer_id,
    txn_date,
    transaction_amount,
    transaction_type
FROM bank_data.staging.stg_bank_data;


-- LOAN FACT TABLE
-- =========================================================

CREATE OR REPLACE TABLE fact_loans AS
SELECT 
    loan_id,
    customer_id,
    loan_amount,
    loan_status
FROM bank_data.staging.stg_bank_data
WHERE loan_id IS NOT NULL;


-- CREDIT CARD FACT TABLE
-- =========================================================

CREATE OR REPLACE TABLE fact_credit_cards AS
SELECT
    card_id,
    customer_id,
    credit_limit,
    credit_balance
FROM bank_data.staging.stg_bank_data
WHERE card_id IS NOT NULL;