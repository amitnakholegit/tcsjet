{% macro money() -%}
::decimal(16,4)
{%- endmacro %}
 
 
{% macro dol_eur(colm, deci) -%}
    round( 0.85 * {{ colm }}, {{ deci }})
{%- endmacro %}

{% macro dol_inr(colm, deci) -%}
    round( 85.37 * {{ colm }}, {{ deci }})
{%- endmacro %}
 