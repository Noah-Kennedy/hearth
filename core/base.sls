install_base:
  pkg.installed:
    - refresh: true
    - pkgs:
        - neovim
        - vim
        - curl
        - sudo
        - zsh

update_packages:
  pkg.uptodate:
    - refresh: true

noah:
  user.present:
    - fullname: Noah Kennedy
    - shell: /usr/bin/zsh
    - groups:
      - sudo
