# macOS Quickstart
Running `./mac-dev-setup.sh --install` on a fresh install of macOS will result in the following end-state:

1. Homebrew installed
1. GNU Bash + core utils
   - Default shell for user switched to bash
   - passwordless sudo
1. Python 3 installed
1. Go installed
1. Several Useful tools:
   - Virtualbox (not by default, because of licensing)
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
   - Temurin JDK
   - ...

# Full list

### Brew Packages
```
 $ ▶ sed -n '/BREW_PKGS=(/,/)/p' mac-dev-setup.sh | grep -vE 'BREW_PKGS|)'
  #amphetamine
  ansible
  arping
  asciinema
  aspell
  atuin
  aws-shell
  awscli
  awslogs
  aws/tap/eks-anywhere
  bandwhich
  bash
  bash-completion
  bash-git-prompt
  bat
  btop
  binutils
  blueutil
  bpytop
  brew-cask-completion
  cdrtools
  chart-testing
  cheat
  #consul
  coreutils
  cowsay
  croc
  #coursier
  ctop
  curl
  curlie
  datamash
  derailed/popeye/popeye
  diffutils
  dive
  dnsglobe
  #docker-credential-helper
  #dog # deprecated in brew, use doge - not in brew yet
  duf
  dust
  ed
  envv
  exiftool
  expect
  eza
  fastfetch
  fend
  ffmpeg
  findutils
  fortune
  gawk
  gcal
  gh
  jmainguy/tap/ghreport
  jnv
  gifsicle
  gist
  git
  git-crypt
  git-extras
  gitlogue
  glances
  #glide
  glow
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
  govc
  gpg
  gping
  grep
  grex
  gzip
  haste-client
  helm
  honker
  htop
  httpie
  hub
  hunk
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
  karabiner-elements
  kata
  keepassc
  keycastr
  kind
  kondo
  krew
  kluctl/tap/kluctl
  kubeconform
  kubectl
  kubectx
  #kube-score/tap/kube-score
  kubespy
  lastpass-cli
  lazy-tmux
  libyang
  lilypond
  lima
  livebook-cli
  lolcat
  #mplayer
  mtr
  multipass
  #neofetch
  nats
  network-doctor
  nmap
  nvm
  nvtop
  openkermit
  openssl
  openshift-cli
  oxker
  oxvg
  p7zip
  #packer
  podman
  procs
  psgrep
  pstree
  psutils
  pv
  python3
  readline
  ripgrep
  rdp/homebrew-openssh-gssapi
  screen
  shottr
  sipsak
  skopeo
  #speedtest-cli (replaced by ookla's version)
  stern
  stress
  task
  terraform
  terraform_landscape
  tfenv
  thefuck
  tldr
  tree
  usbtree
  visidata
  #vagrant-completion
  #vault
  wakeonlan
  watch
  wdiff
  wget
  wireshark # maybe cask this later? ... homebrew/cask/wireshark
  worktrunk
  wrk
  xh
  #youtube-dl
  yt-dlp
  yq
```

### Casks
```
 $ ▶ sed -n '/BREW_CASKS=(/,/)/p' mac-dev-setup.sh | grep -vE 'BREW_CASKS|)'
  balenaetcher
  calibre
  canario
  caskhub
  clamxav
  clipy
  discord
  #docker
  #docker-toolbox
  fing
  firefox
  font-nexon-bazzi
  font-nexon-lv2-gothic
  font-nexon-maplestory
  gitify
  #google-chrome
  headroom
  hey
  itsycal
  joplin
  #keybase - was having install/update issues, temp. disabled it (9/9/24)
  macvim
  nomad
  openvpn-connect
  pingplotter
  postman
  sdformatter
  #slack
  #DEP spectacle
  rectangle
  sonic-visualiser
  synergy
  temurin
  textream
  transmit
  vagrant
  #virtualbox
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
  #instrumenta/instrumenta,kubeval
  hakky54/crip,crip
  robusta-dev/homebrew-krr,krr
  teamookla/speedtest,speedtest
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
