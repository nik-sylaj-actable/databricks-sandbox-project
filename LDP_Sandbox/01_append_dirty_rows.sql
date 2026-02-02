-- =========================================
-- 01_append_dirty_rows.sql
-- Appends a few "dirty" / duplicate rows to BRONZE for learning:
--  - duplicates customer_id values
--  - invalid phone formatting (removes dashes)
-- =========================================

INSERT INTO main.sandbox_bronze.brz_tpch_customer
SELECT
  customer_id,
  concat('   ', customer_name, '   ')  AS customer_name,  -- adds whitespace to trim in Silver
  address,
  nation_key,
  regexp_replace(phone, '-', '') AS phone,                -- invalid format vs TPCH standard
  account_balance,
  market_segment,
  comment,
  current_timestamp() AS ingested_at
FROM main.sandbox_bronze.brz_tpch_customer
LIMIT 25;
