-- Singular test: a bare SELECT that should return ZERO rows if the data is valid.
-- dbt runs this file as-is; any row returned counts as a failure.
select *
from {{ ref('fct_order_items') }}
where line_total <= 0
