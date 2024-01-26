select 
    productid,
    productname,
    category,
    subcategory,
SUM(orderprofit) as profit
from {{ ref('stg_orders') }}
group by
    productid,
    productname,
    category,
    subcategory