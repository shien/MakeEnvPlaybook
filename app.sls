{% set user = 'shien' %}

vim-install:
  pkg.installed:
    - name: vim-common

nginx-install:
  pkg.installed:
    - name: nginx

git-install:
  pkg.installed:
    - name: git

tmux-install:
  pkg.installed:
    - name: tmux

docker-install:
  pkg.installed:
    - name: docker

/tmp/go1.9.2.linux-amd64.tar.gz:
  file.managed:
    - source: https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
    - skip_verify: True

extract_go:
  archive.extracted:
  - name: /home/{{ user }}/go1.9.2
  - source: /tmp/go1.9.2.linux-amd64.tar.gz
  - user: {{ user }}
  - group: {{ user }}
  - if_missing: /home/{{ user }}/go1.9.2
