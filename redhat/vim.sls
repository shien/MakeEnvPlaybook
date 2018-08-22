{% set user = 'shien' %}
{% set dir = '.cache' %}

ncurses-install:
  pkg.installed:
      - name: ncurses

ncurses-devel-install:
  pkg.installed:
      - name: ncurses-devel

/home/{{ user }}/src/vim:
  file.absent

git clone https://github.com/vim/vim.git /home/{{ user }}/src/vim:
  cmd.run:
    - runas: {{ user }}

cd /home/{{ user }}/src/vim && ./configure && make && sudo make install:
  cmd.run:
    - runas: shien

/tmp/installer.sh:
  file.managed:
    - source: https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
    - skip_verify: True

sh /tmp/installer.sh /home/{{ user }}/{{ dir }}:
  cmd.run

/home/{{ user }}/{{ dir }}:
  file.directory:
    - source: /home/{{ user }}/{{ dir }}
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - recurse:
      - user
      - group
      - mode
    - skip_verify: True
    - if_missing: /home/{{ user }}/{{ dir }}

/etc/sudoers.d/{{ user }}:
  file.managed:
    - source: salt://files/{{ user }}
    - user: root
    - group: root
    - mode: 600
    - skip_verify: True
