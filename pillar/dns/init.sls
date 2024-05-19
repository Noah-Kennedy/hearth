dns:
  primary: alexandria
  upstream_tls: cloudflare-dns.com
  upstreams:
    - ip: 1.1.1.1
      tls: true
    - ip: 1.0.0.1
      tls: true
    - ip: 2606:4700:4700::1111
      tls: true
    - ip: 2606:4700:4700::1001
      tls: true
    # If Cloudflare experiences a production incident, fallback to google
    - ip: 8.8.8.8
      tls: false
    - ip: 8.8.4.4
      tls: false
