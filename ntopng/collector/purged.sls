{% from "ntopng/collector/map.jinja" import collector with context %}

ntopng.collector.purged:
  pkg.purged:
    - name: {{ ntopng.package }}
