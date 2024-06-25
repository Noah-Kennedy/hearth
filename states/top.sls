base:
  '*':
    - core.base
    - prometheus
    - dns
    - grafana

  'roles:storage':
    - match: grain
    - postgres
    - redis
#    - vector

  'roles:valheim':
    - match: grain
    - valheim
