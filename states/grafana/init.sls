grafana:
  pkgrepo.managed:
    - humanname: Grafana PPA
    - name: deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main
    - file: /etc/apt/sources.list.d/grafana.list
    - key_text: |
        -----BEGIN PGP PUBLIC KEY BLOCK-----

        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
        =J9CI
        -----END PGP PUBLIC KEY BLOCK-----
  pkg.installed:
    - refresh: true
    - pkgs:
        - grafana-enterprise

/etc/grafana/grafana.ini:
  file.managed:
    - source: salt://grafana/grafana.ini.jinja
    - makedirs: true
    - template: jinja

grafana-server:
  service.running:
    - name: grafana-server
    - enable: true
    - watch:
        - pkg: grafana
        - file: /etc/grafana/grafana.ini
