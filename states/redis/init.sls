/etc/redis/redis.conf:
  file.managed:
    - source: salt://redis/redis.conf.jinja
    - makedirs: true
    - template: jinja

/etc/systemd/system/redis.service:
  file.managed:
    - source: salt://redis/redis.service

redis:
  pkg.installed:
    - refresh: true
    - pkgs:
        - redis
  service.running:
    - enable: true
    - watch:
        - file: /etc/systemd/system/redis.service
        - file: /etc/redis/redis.conf
        - pkg: redis
