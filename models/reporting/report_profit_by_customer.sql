select 
    customerid,
    segment,
    country,
SUM(orderprofit) as profit
from {{ ref('stg_orders') }}
group by
    customerid,
    segment,
    country