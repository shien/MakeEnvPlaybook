{% set user = 'shien' %}

/home/{{ user }}/go:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - makedirs: True

/tmp/go1.9.2.linux-amd64.tar.gz:
  file.managed:
    - source: https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
    - skip_verify: True

extract_go:
  archive.extracted:
  - name: /home/{{ user }}/src/go1.9.2
  - source: /tmp/go1.9.2.linux-amd64.tar.gz
  - user: {{ user }}
  - group: {{ user }}
  - if_missing: /home/{{ user }}/src/go1.9.2

go get github.com/revel/revel:
  cmd.run:
    - runas: {{ user }}

go get github.com/revel/cmd/revel:
  cmd.run:
    - runas: {{ user }}

go get github.com/nlopes/slack:
  cmd.run:
    - runas: {{ user }}
