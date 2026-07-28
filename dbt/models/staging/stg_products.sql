with source as (
    select * from {{ ref('products') }}
)

select
    id as product_id,
    name as product_name,
    category as product_category,
    price as list_price,
    stock_quantity
from source
