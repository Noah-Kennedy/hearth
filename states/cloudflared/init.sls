cloudflared_download:
  file.managed:
    - name: /usr/local/bin/cloudflared
    - source: https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-{{ grains.osarch }}
    - enforce_toplevel: false
    - skip_verify: true
    - mode: 755

cloudflared_config:
  file.managed:
    - name: /etc/cloudflared/config.yaml
    - source: salt://cloudflared/config.yaml.jinja
    - makedirs: true
    - template: jinja

cloudflared_creds:
  file.managed:
    - name: /etc/cloudflared/credentials.json
    - source: salt://cloudflared/credentials.json.jinja
    - makedirs: true
    - template: jinja

cloudflared_cert:
  file.managed:
    - name: /etc/cloudflared/cert.pem
    - contents_pillar: secrets:cloudflared:tunnels:alexandria:cert

cloudflared:
  file.managed:
    - require:
        - file: /usr/local/bin/cloudflared
        - file: /etc/cloudflared/config.yaml
        - file: /etc/cloudflared/credentials.json
        - file: /etc/cloudflared/cert.pem
    - name: /etc/systemd/system/cloudflared.service
    - source: salt://cloudflared/cloudflared.service.jinja
    - template: jinja
  service.running:
    - require:
        - file: /usr/local/bin/cloudflared
        - file: /etc/cloudflared/config.yaml
        - file: /etc/systemd/system/cloudflared.service
        - file: /etc/cloudflared/credentials.json
        - file: /etc/cloudflared/cert.pem
    - enable: true
