with fct as (
    select * from {{ ref('fct_order_items') }}
),

customer_agg as (
    select
        customer_id,
        customer_name,
        city,
        membership_level,
        count(distinct order_id) as total_orders,
        round(sum(line_total), 2) as total_spent,
        round(sum(line_total) / count(distinct order_id), 2) as avg_order_value
    from fct
    group by customer_id, customer_name, city, membership_level
)

select
    *,
    rank() over (order by total_spent desc) as spend_rank
from customer_agg
