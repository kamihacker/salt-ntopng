{%- from "snmp/server/map.jinja" import snmp with context -%}

{% set package = {
  'upgrade': salt['pillar.get']('snmp:package:upgrade', False),
} %}

{% set service = {
  'name': snmp.service,
  'manage': salt['pillar.get']('snmp:service:manage', False),
  'running': salt['pillar.get']('snmp:service:running', True),
  'enable': salt['pillar.get']('snmp:service:enable', True),
} %}

{% set config = {
  'manage': salt['pillar.get']('snmp:config:manage', False),
  'contact': salt['pillar.get']('snmp:config:contact', None),
  'location': salt['pillar.get']('snmp:config:location', None),
  'rocommunities': salt['pillar.get']('snmp:config:rocommunities', ['public']),
  'rwcommunities': salt['pillar.get']('snmp:config:rwcommunities', []),
  'source': salt['pillar.get']('snmp:config:source', 'salt://snmp/conf/snmpd.conf'),
} %}
