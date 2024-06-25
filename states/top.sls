base:
  '*':
    - core.base
    - prometheus
    - dns
    - grafana
    {%- if pillar.metals.get(grains.host).cloudflared is defined %}
    - cloudflared
    {%- endif %}

  'roles:storage':
    - match: grain
    - postgres
    - redis
#    - vector

  'roles:valheim':
    - match: grain
    - valheim
