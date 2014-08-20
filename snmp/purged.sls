{% from "snmp/map.jinja" import snmp with context %}

snmp.installed:
  pkg.purged:
    - name: {{ snmp.package }}
