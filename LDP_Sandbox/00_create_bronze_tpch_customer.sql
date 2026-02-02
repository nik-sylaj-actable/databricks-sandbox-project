-- =========================================
-- 00_create_bronze_tpch_customer.sql
-- Creates a small BRONZE Delta table from Databricks sample data:
--   samples.tpch.customer
-- =========================================

-- Edit these if needed:
CREATE SCHEMA IF NOT EXISTS main.sandbox_bronze;
CREATE SCHEMA IF NOT EXISTS main.sandbox_silver;

CREATE OR REPLACE TABLE main.sandbox_bronze.brz_tpch_customer AS
SELECT
  c_custkey     AS customer_id,
  c_name        AS customer_name,
  c_address     AS address,
  c_nationkey   AS nation_key,
  c_phone       AS phone,
  c_acctbal     AS account_balance,
  c_mktsegment  AS market_segment,
  c_comment     AS comment,
  current_timestamp() AS ingested_at
FROM samples.tpch.customer;
