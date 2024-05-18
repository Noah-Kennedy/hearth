#/etc/hosts:
#  file.managed:
#    - source: salt://dns/hosts

{% if 'alexandria' in grains['host'] %}

coredns_download:
  archive.extracted:
    - name: /usr/local/bin
    - source: https://github.com/coredns/coredns/releases/download/v1.11.1/coredns_1.11.1_linux_amd64.tgz
    - source_hash: https://github.com/coredns/coredns/releases/download/v1.11.1/coredns_1.11.1_linux_amd64.tgz.sha256
    - enforce_toplevel: false

coredns_config:
  file.managed:
    - name: /etc/coredns/Corefile
    - source: salt://dns/Corefile
    - makedirs: true

coredns:
  file.managed:
    - name: /etc/systemd/system/coredns.service
    - source: salt://dns/coredns.service
  service.running:
    - enable: true
    - watch:
        - file: /etc/coredns/Corefile
#        - file: /etc/hosts

{% endif %}

/etc/resolv.conf:
  file.managed:
    - source: salt://dns/resolv.conf
