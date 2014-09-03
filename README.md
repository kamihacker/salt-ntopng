salt-snmp
==========

Salt formula to set up and configure [netsnmp](http://netsnmp.org)

Parameters
------------
Please refer to example.pillar.sls for a list of available pillar configuration options

Usage
-----
- Apply state 'snmp.server.install' to install netsnmp server to target minions
- Apply state 'snmp.client.install' to install netsnmp client to target minions
- Apply state 'snmp.purge' to remove all netsnmp packages and configuration from target minions
State 'snmp' is provided as an alias for snmp.server.install + snmp.client.install

Compatibility
-------------
Ubuntu 13.10, 14.04 and CentOS 6.x
