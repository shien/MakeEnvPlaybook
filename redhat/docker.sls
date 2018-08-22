{% set user = 'root' %}
{% set unames = 'Linux' %}
{% set unamem = 'x86_64' %}
{% set composeversion = '1.21.2' %}

yum-utils-install:
  pkg.installed:
      - name: yum-utils

device-mapper-persistent-data-install:
  pkg.installed:
      - name: device-mapper-persistent-data

lvm2-install:
  pkg.installed:
      - name: lvm2

/etc/yum.repos.d/docker-ce.repo:
  file.managed:
    - source: salt://files/docker-ce.repo
    - user: root
    - group: root
    - mode: 644

docker-ce-install:
  pkg.installed:
      - name: docker-ce

/usr/local/bin/docker-compose:
  file.managed:
    - source: https://github.com/docker/compose/releases/download/{{ composeversion }}/docker-compose-{{ unames }}-{{ unamem }}
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - source_hash: 5a9ccbe01cbf585732907f38fbacc21aecd2edc9351bd1ee91df750740a7fff9d73bd489d708087d9d8892ad8f448a78a8ee401d240a51d0202ed0c08e30bf88

