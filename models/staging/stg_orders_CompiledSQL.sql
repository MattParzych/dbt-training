select 
-- from raw_orders
md5(cast(coalesce(cast(o.orderid as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(c.customerid as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(p.productid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as surr_key,
o.orderid, o.orderdate, o.shipdate, o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice, o.ordersellingprice,
-- from raw_customer
c.customerid, c.customername, c.segment, c.country,
-- from raw_product
p.productid, p.category, p.productname, p.subcategory,

(o.ordersellingprice - o.ordercostprice) / o.ordercostprice
 as pct_revenue,
d.delivery_team
from Analytics.dbt_mparzych.raw_orders as o
left join Analytics.dbt_mparzych.raw_customer as c
on o.customerid = c.customerid
left join Analytics.dbt_mparzych.raw_product as p
on o.productid = p.productid
left join Analytics.dbt_mparzych.delivery_team as d
on o.shipmode = d.shipmode