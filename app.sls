{% set nginxuser = 'nginx' %}

nginx-install:
  pkg.installed:
    - name: nginx

git-install:
  pkg.installed:
    - name: git

tmux-install:
  pkg.installed:
    - name: tmux
