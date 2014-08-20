{% from "snmp/client/map.jinja" import snmp with context %}

snmp.client.purged:
  pkg.purged:
    - name: {{ snmp.package }}
