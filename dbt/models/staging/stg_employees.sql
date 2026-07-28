with source as (
    select * from {{ ref('employees') }}
)

select
    id as employee_id,
    name as employee_name,
    department,
    cast(hire_date as date) as hire_date,
    salary
from source
