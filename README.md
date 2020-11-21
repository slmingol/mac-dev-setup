# macOS Quickstart
Running `./mac-dev-setup.sh` on a fresh install of macOS will result in the following end-state:

1. Homebrew installed
1. GNU Bash + core utils
   - Default shell for user switched to bash
   - passwordless sudo
1. Python 3 installed
1. Go installed
1. Several Useful tools:
   - Virtualbox
   - Vagrant
   - Visual Studio Code
   - Git
   - Slack
   - Google Chrome
   - Docker
   - Packer
   - Terraform
   - Consul
   - Vault
   - Nomad
   - AWS cli
   - Drone cli
   - ...

# Full list

### Brew Packages
```
$ sed -n '/BREW_PKGS=(/,/)/p' mac-dev-setup.sh | grep -vE 'BREW_PKGS|)'
  ansible
  asciinema
  aspell
  awless
  aws-shell
  awscli
  awslogs
  bash
  bash-completion
  bash-git-prompt
  binutils
  brew-cask-completion
  cdrtools
  consul
  coreutils
  cowsay
  curl
  datamash
  diffutils
  ed
  findutils
  fortune
  gawk
  gifsicle
  gist
  git
  git-crypt
  git-extras
  github/gh/gh
  glide
  gnu-indent
  gnu-sed
  gnu-tar
  gnu-time
  gnu-units
  gnu-which
  gnuplot
  gnutls
  go
  gpg
  grep
  gzip
  haste-client
  helm
  hey
  htop
  hub
  iftop
  imagemagick
  ipcalc
  iperf3
  iproute2mac
  irssi
  jid
  jp
  jq
  kind
  kubectl
  kubectx
  kube-score/tap/kube-score
  kubespy
  lastpass-cli
  less
  lolcat
  macvim
  mtr
  neofetch
  nmap
  nomad
  openssl
  openshift-cli
  p7zip
  packer
  psgrep
  pstree
  psutils
  pv
  python3
  readline
  screen
  speedtest-cli
  stern
  stress
  task
  terraform
  terraform_landscape
  thefuck
  tree
  vagrant-completion
  vault
  virt-viewer
  watch
  wdiff
  wget
  yq
```

### Casks
```
$ sed -n '/BREW_CASKS=(/,/)/p' mac-dev-setup.sh | grep -vE 'BREW_CASKS|)'
  balenaetcher
  calibre
  clamxav
  clipy
  discord
  docker
  docker-toolbox
  fing
  firefox
  gitify
  google-chrome
  keybase
  openvpn-connect
  pingplotter
  podman
  postman
  slack
  spectacle
  transmit
  vagrant
  virtualbox
  #virtualbox-extension-pack
  visual-studio-code
```

### Taps
```
$ sed -n '/BREW_TAPS=(/,/)/p' mac-dev-setup.sh | grep -vE 'BREW_TAPS|)'
  drone/drone,drone
  jmespath/jmespath,jp
  johanhaleby/kubetail,kubetail
  wallix/awless,awless
```
