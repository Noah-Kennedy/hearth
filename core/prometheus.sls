prometheus-node-exporter:
  pkg.installed:
    - refresh: true
    - pkgs:
        - prometheus-node-exporter
  service.running:
    - require:
        - pkg: prometheus-node-exporter
    - enable: true
    - reload: true
    - watch:
      - pkg: prometheus-node-exporter
