{%- from "ntopng/collector/map.jinja" import snmp with context -%}
{%- from "ntopng/collector/lib.sls" import package with context -%}

ntopng.installed:
  pkg.{{ 'latest' if package.upgrade else 'installed' }}:
    - name: {{ ntopng.package }}
