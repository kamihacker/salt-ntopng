snmp:
  package:
    upgrade: False
  service:
    manage: False
    running: True
    enable: True
  config:
    manage: False
    contact: None
    location: None
    rocommunities: 
      - public:
    rwcommunities: []
    source: salt://snmp/conf/snmpd.conf
  lookup:
    server:
      package: snmpd
      service: snmpd
      config: /etc/snmp/snmp.conf
    client:
      package: snmp
