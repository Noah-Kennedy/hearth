coredns_download:
  archive.extracted:
    - name: /usr/local/bin/coredns
    - source: https://github.com/coredns/coredns/releases/download/v1.11.1/coredns_1.11.1_linux_{{ grains.osarch }}.tgz
    - source_hash: https://github.com/coredns/coredns/releases/download/v1.11.1/coredns_1.11.1_linux_{{ grains.osarch }}.tgz.sha256
    - enforce_toplevel: false

coredns_config:
  file.managed:
    - name: /etc/coredns/Corefile
    - source: salt://dns/Corefile.jinja
    - makedirs: true
    - template: jinja

coredns:
  file.managed:
    - name: /etc/systemd/system/coredns.service
    - require:
        - archive: /usr/local/bin/coredns
        - file: /etc/coredns/Corefile
    - source: salt://dns/coredns.service
  service.running:
    - enable: true
    - watch:
        - file: /etc/systemd/system/coredns.service
        - file: /etc/coredns/Corefile
        - archive: /usr/local/bin/coredns

/etc/resolv.conf:
  file.managed:
    - source: salt://dns/resolv.conf.jinja
    - template: jinja
