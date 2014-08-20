{%- from "snmp/server/map.jinja" import snmp with context -%}
{%- from "snmp/server/lib.sls" import package with context -%}
{%- from "snmp/server/lib.sls" import service with context -%}
{%- from "snmp/server/lib.sls" import config with context -%}

snmp.server.installed:
  pkg.{{ 'latest' if package.upgrade else 'installed' }}:
    - name: {{ snmp.package }}
  {% if service.manage -%}
  service.{{ 'running' if service.enable else 'dead' }}:
    - name: {{ service.name }}
    - enable: {{ service.enable }}
    - require:
      - pkg: snmp.server.installed
      - file: snmp.server.installed
    - watch:
      - pkg: snmp.server.installed
      - file: snmp.server.installed
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
      - pkg: snmp.server.installed
  {% endif %}
