base:
  '*':
    - core.base
    - prometheus
    {%- if pillar.metals.get(grains.host).cloudflared is defined %}
    - cloudflared
    {%- endif %}

  'roles:storage':
    - match: grain
    - postgres
    - redis
    - dns
    {%- if grains.cpuarch == 'x86_64' %}
    - grafana
    {%- endif %}

  'roles:valheim':
    - match: grain
    - valheim
