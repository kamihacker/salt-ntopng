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
    communities: 
      public:
        write: False
        sources: 
          - 0.0.0.0/0
        oid: .1
    source: salt://snmp/conf/snmp.conf
  lookup:
    package: snmp
    service: snmp
    config: /etc/snmp/snmp.conf
