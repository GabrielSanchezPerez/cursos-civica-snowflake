{% macro validador_telefono(phone) %}
  
 
    {% if phone == '([0-9]{9})' %}
        {% set resultado = phone %}
    {% else %}
        {% set resultado = 999999999 %}
    {% endif %}


{{ return(resultado) }}
{% endmacro %}
