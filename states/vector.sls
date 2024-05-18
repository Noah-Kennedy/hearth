vector:
  pkg.installed:
    - refresh: true
    - pkgs:
        - vector
  file.managed:
    - name: /etc/vector/vector.yaml
    - source: salt://vector.yaml.jinja
    - template: jinja

  service.running:
    - enable: true
    - watch:
        - file: /etc/vector/vector.yaml