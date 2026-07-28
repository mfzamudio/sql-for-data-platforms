with source as (
    select * from {{ ref('orders') }}
)

select
    id as order_id,
    customer_id,
    cast(order_date as date) as order_date,
    status,
    {{ is_terminal_status('status') }} as is_terminal_status
from source
