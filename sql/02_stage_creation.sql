CREATE OR REPLACE STAGE public.s3_stage
URL = 's3://bank-data-tanaji/'
STORAGE_INTEGRATION = s3_integration
 
-- test stage

LIST @public.s3_stage;
