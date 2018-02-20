{% set nginxuser = 'nginx' %}

nginx-install:
  pkg.installed:
    - name: nginx

/etc/nginx/default.d/typing-game-server.conf:
  file.managed:
    - source: salt://files/typing-game-server.conf
    - user: {{ nginxuser }}
    - group: {{ nginxuser }}
    - mode: 700
    - skip_verify: True

git-install:
  pkg.installed:
    - name: git

tmux-install:
  pkg.installed:
    - name: tmux

docker-install:
  pkg.installed:
    - name: docker
