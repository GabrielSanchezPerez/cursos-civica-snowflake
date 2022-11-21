{% macro validador_telefono(phone) %}
  --'[0-9]{3}-[0-9]{3}-[0-9]{4}'
 
    {% if phone == '753-688-7731'  %}
        {% set resultado = phone %}
    {% else %}
        {% set resultado = '999999999' %}
    {% endif %}



{{ return(resultado) }}
{% endmacro %}
