{% macro is_terminal_status(status_column) %}
    case when {{ status_column }} in ('delivered', 'cancelled') then true else false end
{% endmacro %}
