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
  asciiquarium
  asitop
  aspell
  atuin
  aws-shell
  awscli
  awslogs
  aws/tap/eks-anywhere
  aview
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
  broot
  bruno-cli
  cdrtools
  chart-testing
  cheat
  cloudflare-wrangler
  cmatrix
  #consul
  coreutils
  cowsay
  croc
  #coursier
  ctop
  curl
  curlie
  datamash
  delta # git-delta
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
  fd
  fend
  ffmpeg
  figlet
  findutils
  fortune
  fzf
  gawk
  #gcal
  gh
  #DEP jmainguy/tap/ghreport
  jfrog-cli
  jnv
  gifsicle
  gist
  git
  git-crypt
  git-extras
  gitlogue
  ghostty
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
  gogcli
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
  lazydocker
  lazygit
  lazy-tmux
  less
  libyang
  lilypond
  lima
  livebook-cli
  llmfit
  lolcat
  #mplayer
  #macdown #DEP
  mactop
  mcfly
  mole
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
  hashicorp/tap/packer
  podman
  podman-compose
  procs
  psgrep
  pstree
  psutils
  pv
  python3
  readline
  rig
  ripgrep
  rdp/homebrew-openssh-gssapi
  rtk
  screen
  shottr
  sipsak
  skopeo
  #speedtest-cli (replaced by ookla's version)
  stern
  stress
  synergy-core
  task
  hashicorp/tap/terraform
  tealdeer
  terraform
  terraform_landscape
  tfenv
  thefuck
  #tldr # replaced with tealdeer
  tmux
  toilet
  tree
  usbtree
  util-linux
  uv
  visidata
  #vagrant-completion
  #vault
  wakeonlan
  watch
  wdiff
  wget
  wireguard-tools
  wireshark # maybe cask this later? ... homebrew/cask/wireshark
  worktrunk
  wrk
  xh
  #youtube-dl
  yt-dlp
  yq
  zoxide
```

### Casks
```
 $ ▶ sed -n '/BREW_CASKS=(/,/)/p' mac-dev-setup.sh | grep -vE 'BREW_CASKS|)'
  balenaetcher
  bruno
  calibre
  canario
  caskhub
  #clamxav # - disabling never use it (07/26/2025)
  claude-code
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
  keybase
  macvim
  milkman
  #nomad
  openvpn-connect
  pingplotter
  podman-desktop
  #postman
  rectangle
  sdformatter
  #slack
  sonic-visualiser
  temurin
  textream
  transmit
  #vagrant # - disabling never use it (07/26/2025)
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

# References
- [10 Modern CLI Tools You Should Try in 2026](https://medium.com/@sandunlakshan213/10-modern-cli-tools-you-should-try-in-2026-18ce4e16c28e)
