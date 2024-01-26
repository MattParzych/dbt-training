{% macro limit_data_in_dev_macro(colname) %}
{% if target.name == 'development' %}
where {{colname}} >= dateadd('day', -30, current_timestamp)
{% endif %}
{% endmacro %}