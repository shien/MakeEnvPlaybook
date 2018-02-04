{% set user = 'shien' %}

{{ user }}:
  user.present:
    - fullname: Taiki TAIRA
    - shell: /bin/bash
    - home: /home/{{ user }}
    - groups:
      - wheel
    - password: $1$7g4OhZ9s$C85zyVaEVrfDuAePLJ4pT1

/home/{{ user }}/.ssh:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - mode: 700
    - makedirs: True

/home/{{ user }}/.ssh/authorized_keys:
  file.managed:
    - source: salt://files/authorized_keys
    - user: {{ user }}
    - group: {{ user }}
    - mode: 700
    - skip_verify: True

/home/{{ user }}/.vimrc:
  file.managed:
    - source: salt://files/vimrc
    - user: {{ user }}
    - group: {{ user }}
    - mode: 700
    - skip_verify: True

/home/{{ user }}/.bashrc:
  file.managed:
    - source: salt://files/bashrc
    - user: {{ user }}
    - group: {{ user }}
    - mode: 700
    - skip_verify: True

/home/{{ user }}/src:
   file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - recurse:
      - user
      - group
      - mode
