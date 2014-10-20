{%- from "ntopng/collector/map.jinja" import ntopng with context -%}

{% set package = {
  'upgrade': salt['pillar.get']('ntopng:package:upgrade', False),
} %}
