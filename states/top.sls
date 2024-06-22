base:
  '*':
    - core.base
    - prometheus
    - dns

  'roles:storage':
    - match: grain
    - storage
    - redis
#    - vector

  'roles:valheim':
    - match: grain
    - valheim
