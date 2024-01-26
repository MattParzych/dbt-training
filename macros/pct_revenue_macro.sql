{%  macro pct_revenue_macro(sellingprice, costprice) %}
({{sellingprice}} - {{costprice}}) / {{costprice}}
{% endmacro %}