select orderid,
sum(case when category = 'Furniture' then orderprofit end) as Furniture_orderprofit, 
sum(case when category = 'Office' then orderprofit end) as Office_orderprofit, 
sum(case when category = 'Technology' then orderprofit end) as Technology_orderprofit
from Analytics.dbt_mparzych.stg_orders
group by 1