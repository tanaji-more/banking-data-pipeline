
-- STEP 2: CREATE EXTERNAL STAGE


CREATE OR REPLACE STAGE public.s3_stage
URL = 's3://bank-data-tanaji/'
STORAGE_INTEGRATION = s3_integration
 

-- Verify files available in S3


LIST @public.s3_stage;
