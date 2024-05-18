postgresql:
  pkg.installed:
    - refresh: true
    - pkgs:
        - postgresql
  service.running:
    - require:
      - pkg: postgresql
