include:
  - snmp.installed

snmp:
  require:
    - sls: snmp.installed
