{% macro inr_eur(colm, deci) -%}
    round( 0.0100 * {{ colm }}, {{ deci }})
{%- endmacro %}

{% macro inr_yen(colm, deci) -%}
    round( 1.72 * {{ colm }}, {{ deci }})
{%- endmacro %}