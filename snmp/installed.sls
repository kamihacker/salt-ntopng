{%- from "snmp/map.jinja" import snmp with context -%}
{%- from "snmp/lib.sls" import package with context -%}
{%- from "snmp/lib.sls" import service with context -%}
{%- from "snmp/lib.sls" import config with context -%}

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
