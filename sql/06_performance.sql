-- =========================================================
-- STEP 9: PERFORMANCE TUNING
-- =========================================================

USE DATABASE bank_data;
USE SCHEMA warehouse;

-- Apply clustering for faster query performance
ALTER TABLE fact_transactions
CLUSTER BY (txn_date);

-- Example optimized query
SELECT 
    DATE_TRUNC('month', txn_date) AS month,
    SUM(transaction_amount) AS total_amount
FROM fact_transactions
GROUP BY 1
ORDER BY 1;