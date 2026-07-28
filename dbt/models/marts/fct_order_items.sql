with order_items as (
    select * from {{ ref('stg_order_items') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

products as (
    select * from {{ ref('stg_products') }}
)

select
    oi.order_item_id,
    oi.order_id,
    o.order_date,
    o.status as order_status,
    o.customer_id,
    c.customer_name,
    c.city,
    c.membership_level,
    oi.product_id,
    p.product_name,
    p.product_category,
    oi.quantity,
    oi.unit_price,
    oi.line_total
from order_items oi
left join orders o on oi.order_id = o.order_id
left join customers c on o.customer_id = c.customer_id
left join products p on oi.product_id = p.product_id
