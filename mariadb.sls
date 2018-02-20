{% set mariadbuser = 'mariadbuser' %}

mariadb-install:
  pkg.installed:
    - name: mariadb

mariadb-server-install:
  pkg.installed:
    - name: mariadb-server

mariadb:
  service.running:
    - enable: True


