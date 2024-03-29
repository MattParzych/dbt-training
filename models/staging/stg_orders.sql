select 
-- from raw_orders
{{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid', 'p.productid']) }} as surr_key,
o.orderid, o.orderdate, o.shipdate, o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice, o.ordersellingprice,
-- from raw_customer
c.customerid, c.customername, c.segment, c.country,
-- from raw_product
p.productid, p.category, p.productname, p.subcategory,
{{ pct_revenue_macro('o.ordersellingprice', 'o.ordercostprice') }} as pct_revenue,
d.delivery_team
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid
left join {{ ref('delivery_team') }} as d
on o.shipmode = d.shipmode
{{ limit_data_in_dev_macro('o.orderdate') }}