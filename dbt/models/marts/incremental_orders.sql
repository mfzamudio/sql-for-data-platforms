-- Incremental materialization: dbt's production version of Part 8's watermark pattern.
-- First run: builds the full table. Every run after: only processes orders with an
-- order_date newer than what's already in the target (`{{ this }}`), then dbt appends
-- just those rows -- no full rebuild.
{{ config(materialized='incremental', unique_key='order_id') }}

select * from {{ ref('stg_orders') }}

{% if is_incremental() %}
where order_date > (select coalesce(max(order_date), '1900-01-01') from {{ this }})
{% endif %}
