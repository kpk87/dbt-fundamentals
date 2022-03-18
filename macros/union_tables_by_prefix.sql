{%- macro union_relations_by_prefix(database, schema, prefix) -%}

  {%- set tables = dbt_utils.get_relations_by_prefix(database=database, schema=schema, prefix=prefix) -%}

  {% for table in tables %}

      {%- if not loop.first -%}
      union all 
      {%- endif %}
        
      select * from {{ table.database | upper }}.{{ table.schema | upper  }}."{{ table.name }}"
      
  {% endfor -%}
  
{%- endmacro -%}