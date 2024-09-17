/etc/postgresql/15/main/postgresql.conf:
  file.managed:
    - source: salt://postgres/postgresql.conf.jinja
    - makedirs: true
    - template: jinja

/etc/postgresql/15/main/pg_hba.conf:
  file.managed:
    - source: salt://postgres/pg_hba.conf.jinja
    - makedirs: true
    - template: jinja

postgresql:
  pkg.installed:
    - refresh: true
    - pkgs:
        - postgresql
  service.running:
    - watch:
        - pkg: postgresql
        - file: /etc/postgresql/15/main/pg_hba.conf
        - file: /etc/postgresql/15/main/postgresql.conf
