base:
  '*':
    - core.base
    - core.prometheus

  'roles:storage':
    - match: grain
    - storage
