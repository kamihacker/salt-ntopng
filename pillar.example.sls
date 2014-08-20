snmp:
  package:
    upgrade: False
  service:
    manage: False
    running: True
    enable: True
  config:
    manage: False
    source: salt://snmp/conf/snmp.conf
  lookup:
    package: snmp
    service: snmp
    config: /etc/snmp/snmp.conf
