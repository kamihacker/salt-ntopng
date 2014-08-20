{%- from "snmp/client/map.jinja" import snmp with context -%}
{%- from "snmp/client/lib.sls" import package with context -%}

snmp.client.installed:
  pkg.{{ 'latest' if package.upgrade else 'installed' }}:
    - name: {{ snmp.package }}
