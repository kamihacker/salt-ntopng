{% from "snmp/server/map.jinja" import snmp with context %}

snmp.server.purged:
  pkg.purged:
    - name: {{ snmp.package }}
