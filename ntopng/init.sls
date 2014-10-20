include:
  - ntopng.collector.installed

ntopng:
  require:
    - sls: ntopng.collector.installed

