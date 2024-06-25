install_base:
  pkg.installed:
    - refresh: true
    - pkgs:
        - neovim
        - vim
        - curl
        - sudo
        - zsh
        - lshw
        - ncdu
        - htop
        - tmux
        - btop
        - software-properties-common
        - python3-gnupg
        - gpg
        - apt-transport-https

update_packages:
  pkg.uptodate:
    - refresh: true

noah:
  user.present:
    - fullname: Noah Kennedy
    - shell: /usr/bin/zsh
    - groups:
      - sudo
