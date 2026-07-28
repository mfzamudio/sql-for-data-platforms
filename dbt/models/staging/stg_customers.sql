with source as (
    select * from {{ ref('customers') }}
)

select
    id as customer_id,
    name as customer_name,
    email,
    city,
    membership_level,
    cast(created_date as date) as created_date
from source
