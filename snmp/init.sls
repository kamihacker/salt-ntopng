include:
  - snmp.server.installed
  - snmp.client.installed

snmp:
  require:
    - sls: snmp.server.installed
    - sls: snmp.client.installed
