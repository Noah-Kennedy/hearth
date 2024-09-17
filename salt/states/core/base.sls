install_base:
  pkg.installed:
    - refresh: true
    - pkgs:
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
