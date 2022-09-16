# macOS Quickstart
Running `./mac-dev-setup.sh --install` on a fresh install of macOS will result in the following end-state:

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
 $ ▶ sed -n '/BREW_PKGS=(/,/)/p' mac-dev-setup.sh | grep -vE 'BREW_PKGS|)'
  #adoptopenjdk8
  ansible
  arping
  asciinema
  aspell
  aws-shell
  awscli
  awslogs
  aws/tap/eks-anywhere
  bash
  bash-completion
  bash-git-prompt
  binutils
  blueutil
  bpytop
  brew-cask-completion
  cdrtools
  chart-testing
  cheat
  consul
  coreutils
  cowsay
  curl
  curlie
  datamash
  derailed/popeye/popeye
  diffutils
  ed
  ffmpeg
  findutils
  fortune
  gawk
  gh
  gifsicle
  gist
  git
  git-crypt
  git-extras
  glances
  #glide
  gnu-indent
  gnu-sed
  gnu-tar
  gnu-time
  gnu-units
  gnu-which
  gnuplot
  gnutls
  go
  goreleaser
  gpg
  gping
  grep
  gzip
  haste-client
  helm
  htop
  httpie
  hub
  hyperfine
  icdiff
  iftop
  imagemagick
  ipcalc
  iperf3
  iproute2mac
  irssi
  jd
  jid
  jp
  jq
  k9s
  keepassc
  keycastr
  kind
  #krew
  kubectl
  kubectx
  #kube-score/tap/kube-score
  kubespy
  lastpass-cli
  less
  lima
  lolcat
  #mplayer
  mtr
  neofetch
  nmap
  nvm
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
  skopeo
  speedtest-cli
  stern
  stress
  task
  terraform
  terraform_landscape
  tfenv
  thefuck
  tree
  vagrant-completion
  vault
  watch
  wdiff
  wget
  wireshark
  xh
  youtube-dl
  yq
```

### Casks
```
 $ ▶ sed -n '/BREW_CASKS=(/,/)/p' mac-dev-setup.sh | grep -vE 'BREW_CASKS|)'
  balenaetcher
  calibre
  clamxav
  clipy
  discord
  docker
  docker-toolbox
  docker-credential-helper
  fing
  firefox
  gitify
  glow
  #google-chrome
  hey
  itsycal
  keybase
  macvim
  nomad
  openvpn-connect
  pingplotter
  podman
  postman
  screen
  sdformatter
  slack
  spectacle
  synergy
  transmit
  vagrant
  virtualbox
  #virtualbox-extension-pack
  visual-studio-code
  vlc
```

### Taps
```
 $ ▶ sed -n '/BREW_TAPS=(/,/)/p' mac-dev-setup.sh | grep -vE 'BREW_TAPS|)'
  drone/drone,drone
  jmespath/jmespath,jp
  johanhaleby/kubetail,kubetail
  jeffreywildman/homebrew-virt-manager,virt-viewer
  #AdoptOpenJDK/openjdk,adoptopenjdk8
  AdoptOpenJDK/openjdk,adoptopenjdk11
  instrumenta/instrumenta,kubeval
  jmainguy/tap/ghreports
  hakky54/crip
  kluctl/tap/kluctl
```

# Usage
```
 $ ▶ ./mac-dev-setup.sh

./mac-dev-setup.sh [  [-i|--install] | [-u|--upgrade]  ]

```
# Maintenance
After initially installing this you can periodically also run it to 'update' things.

```
 $ ▶ ./mac-dev-setup.sh --upgrade
Already up-to-date.
Pruned 0 symbolic links and 2 directories from /opt/homebrew
==> Fetching /opt/homebrew...

==> Resetting /opt/homebrew...
branch 'master' set up to track 'origin/master'.
Switched to and reset branch 'master'
Your branch is up to date with 'origin/master'.

...
...

Warning: ansible 6.4.0 already installed
Warning: arping 2.23 already installed
Warning: asciinema 2.2.0 already installed
Warning: aspell 0.60.8 already installed
Warning: aws-shell 0.2.2_2 already installed
Warning: awscli 2.7.31 already installed
Warning: awslogs 0.14.0_3 already installed
Warning: aws/tap/eks-anywhere 0.11.2 already installed
Warning: bash 5.1.16 already installed

...
...

To re-install balenaetcher, run:
  brew reinstall --cask balenaetcher
Warning: Cask 'calibre' is already installed.

To re-install calibre, run:
  brew reinstall --cask calibre
Warning: Cask 'clamxav' is already installed.

...
...

$
```
