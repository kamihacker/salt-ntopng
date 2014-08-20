{%- from "snmp/client/map.jinja" import snmp with context -%}

{% set package = {
  'upgrade': salt['pillar.get']('snmp:package:upgrade', False),
} %}
