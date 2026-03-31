-- STEP 10: DATA GOVERNANCE & SECURITY
-- =========================================================

USE DATABASE bank_data;

-- CREATE ROLE
-- =========================================================

CREATE OR REPLACE ROLE analyst;

-- Grant access to warehouse data
GRANT USAGE ON DATABASE bank_data TO ROLE analyst;
GRANT USAGE ON SCHEMA warehouse TO ROLE analyst;
GRANT SELECT ON ALL TABLES IN SCHEMA warehouse TO ROLE analyst;


-- MASKING POLICY FOR SENSITIVE DATA
-- =========================================================

CREATE OR REPLACE MASKING POLICY mask_email AS (val STRING)
RETURNS STRING ->
CASE
    WHEN CURRENT_ROLE() = 'ACCOUNTADMIN' THEN val
    ELSE '****'
END;