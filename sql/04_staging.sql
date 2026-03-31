
-- STEP 7: STAGING LAYER (DATA CLEANING & TRANSFORMATION)
-- =========================================================

USE DATABASE bank_data;
USE SCHEMA staging;

CREATE OR REPLACE TABLE stg_bank_data AS
SELECT
    customer_id,
    LOWER(email) AS email,
    city,
    account_type,
    transaction_id,
    TRY_TO_TIMESTAMP(transaction_date) AS txn_date,
    transaction_amount,
    transaction_type,
    loan_id,
    loan_amount,
    loan_status,
    card_id,
    credit_limit,
    credit_balance,
    feedback_id,
    feedback_type,
    resolution_status,
    anomaly
FROM bank_data.raw.bank_data
WHERE customer_id IS NOT NULL
AND transaction_amount > 0;


-- OPTIONAL: ADD NEW COLUMN IF NEEDED
-- =========================================================

-- ALTER TABLE stg_bank_data ADD COLUMN credit_balance FLOAT;