base:
  '*':
    - core.base
    - core.prometheus
    - dns

  'roles:storage':
    - match: grain
    - storage
#    - vector

  'roles:valheim':
    - match: grain
    - valheim
