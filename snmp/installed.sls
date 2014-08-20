{% from "snmp/map.jinja" import snmp with context %}

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
  'source': salt['pillar.get']('snmp:config:source', 'salt://snmp/conf/snmp.conf'),
} %}

snmp.installed:
  pkg.{{ 'latest' if package.upgrade else 'installed' }}:
    - name: {{ snmp.package }}
  {% if service.manage -%}
  service.{{ 'running' if service.enable else 'dead' }}:
    - name: {{ service.name }}
    - enable: {{ service.enable }}
    - require:
      - pkg: snmp.installed
      - file: snmp.installed
    - watch:
      - pkg: snmp.installed
      - file: snmp.installed
  {% endif -%}
  {% if config.manage %}
  file.managed:
    - name: {{ snmp.config }}
    - source: {{ config.source }}
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: snmp.installed
  {% endif %}
