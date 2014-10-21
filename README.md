salt-ntopng
===========

Salt formula to set up and configure [ntopng](http://www.ntop.org/products/ntop/) as a flow collector

Parameters
------------
Please refer to pillar.example.sls for a list of available pillar configuration options

Usage
-----
- Apply state 'ntopng.client.installed' to install ntopng
- Apply state 'ntopng.purge' to remove all ntopng packages and configuration from target minions

Compatibility
-------------
CentOS 6.x
