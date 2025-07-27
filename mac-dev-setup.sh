#!/bin/bash

set -e

# usage
usage(){
    echo ""
    echo "$0 [  [-i|--install] | [-u|--upgrade]  ]"
    echo ""
    exit 1
}

# helper function for installing a package via brew
brew_pkg(){
    if brew ls --versions $1 > /dev/null; then
        brew upgrade $1
    else
        brew install $1
    fi
}

# helper function for installing a package via brew cask
brew_cask(){
    brew install --cask $1
}

# helper function for installing a package via brew tap
brew_tap(){
    local TAP=$1
    local PKG=$2
    brew tap $TAP
    brew_pkg $PKG
}

# Main
key="$1"

case $key in
    -i|--install)
    MODE="install"
    ;;
    -u|--upgrade)
    MODE="upgrade"
    ;;
    *)
    usage
    ;;
esac

# tests for a GitHub Personal Access Token (PAT) for use against their API
[[ -e ~/.config/brew_gh_token ]] && export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.config/brew_gh_token)

## Temporarily disable gatekeeper to prevent installations from failing
#sudo spctl --status
#sudo spctl --global-disable
#sudo spctl --status
## REF: https://derflounder.wordpress.com/2024/09/23/spctl-command-line-tool-no-longer-able-to-manage-gatekeeper-on-macos-sequoia/

# Speed up keypresses
# https://apple.stackexchange.com/questions/10467/how-to-increase-keyboard-key-repeat-rate-on-os-x
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# Install homebrew if it's not already installed
type brew &> /dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if [ "$MODE" == "upgrade" ]; then
    brew update
    brew cleanup
    brew update-reset
fi

# Install packages
BREW_PKGS=(
  #amphetamine
  ansible
  arping
  asciinema
  asciiquarium
  asitop
  aspell
  aws-shell
  awscli
  awslogs
  aws/tap/eks-anywhere
  aview
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
  cmatrix
  #consul
  coreutils
  cowsay
  #coursier
  ctop
  curl
  curlie
  datamash
  derailed/popeye/popeye
  diffutils
  dive
  #docker-credential-helper
  #dog # deprecated in brew, use doge - not in brew yet
  duf
  dust
  ed
  exiftool
  expect
  eza
  fastfetch
  ffmpeg
  figlet
  findutils
  fortune
  fzf
  gawk
  #gcal
  gh
  #DEP jmainguy/tap/ghreport
  jnv
  gifsicle
  gist
  git
  git-crypt
  git-extras
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
  karabiner-elements
  keepassc
  keycastr
  kind
  krew
  kluctl/tap/kluctl
  kubeconform
  kubectl
  kubectx
  #kube-score/tap/kube-score
  kubespy
  lastpass-cli
  less
  lilypond
  lima
  lolcat
  #mplayer
  mcfly
  mtr
  multipass
  #neofetch
  nmap
  nvm
  nvtop
  openssl
  openshift-cli
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
  rig
  ripgrep
  screen
  shottr
  skopeo
  #speedtest-cli (replaced by ookla's version)
  stern
  stress
  synergy-core
  task
  terraform
  terraform_landscape
  tfenv
  thefuck
  tldr
  tmux
  toilet
  tree
  #vagrant-completion
  #vault
  wakeonlan
  watch
  wdiff
  wget
  wireshark # maybe cask this later? ... homebrew/cask/wireshark
  wrk
  xh
  #youtube-dl
  yt-dlp
  yq
  zoxide
)
for pkg in ${BREW_PKGS[@]};do brew_pkg $pkg;done

# https://github.com/rdp/homebrew-openssh-gssapi
brew tap rdp/homebrew-openssh-gssapi


# Install casks
BREW_CASKS=(
  balenaetcher
  bruno
  calibre
  #clamxav # - disabling never use it (07/26/2025)
  clipy
  discord
  #docker
  #docker-toolbox
  fing
  firefox
  gitify
  #google-chrome
  hey
  itsycal
  joplin
  keybase
  macvim
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
  transmit
  #vagrant # - disabling never use it (07/26/2025)
  #virtualbox
  #virtualbox-extension-pack
  visual-studio-code
  vlc
)
for cask in ${BREW_CASKS[@]};do brew_cask $cask;done

# Install taps
# FORMAT: <tap_url_or_github_repo>,<pkg_name>
BREW_TAPS=(
  drone/drone,drone
  jmespath/jmespath,jp
  johanhaleby/kubetail,kubetail
  jeffreywildman/homebrew-virt-manager,virt-viewer
  #instrumenta/instrumenta,kubeval
  hakky54/crip,crip
  #robusta-dev/homebrew-krr,krr # - wasn't working 07/26/2025
  teamookla/speedtest,speedtest
)
for tap in ${BREW_TAPS[@]};do
  TAP=$(echo $tap | cut -d, -f1)
  PKG=$(echo $tap | cut -d, -f2)
  brew_tap $TAP $PKG
done

if [ "$MODE" == "install" ]; then
    # Make sure you get all the PATH elements into ~/.bash_profile.
    # You may still need to manually tweak things to your liking.
    echo 'PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/binutils/bin:/usr/local/opt/gettext/bin:/usr/local/opt/gnu-getopt/bin:/usr/local/opt/ed/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-indent/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/opt/gnu-which/libexec/gnubin:/usr/local/opt/grep/libexec/gnubin:${HOME}/Library/Python/3.7/bin:$PATH"' >> ~/.bash_profile_path_gnu

    # Add our shiny new shell to the list of approved shells in macOS
    # REF: https://apple.stackexchange.com/questions/224511/how-to-use-bash-as-default-shell
    grep -q "$(brew --prefix)/bin/bash" /etc/shells || echo "$(brew --prefix)/bin/bash" | sudo tee -a /etc/shells

    # Switch to our new shell permanently
    chsh -s $(brew --prefix)/bin/bash

    # I'm too good to constantly type my password ...
    ME=$(whoami)
    echo "$ME   ALL = (ALL) NOPASSWD:ALL" | sudo tee -a /private/etc/sudoers.d/$ME
    sudo chmod 0400 /private/etc/sudoers.d/$ME
fi

# Re-enable gatekeeper
##sudo spctl --global-enable
sudo spctl --add /Applications/Visual\ Studio\ Code.app
#sudo spctl --add /Applications/VirtualBox.app

if [ "$MODE" == "install" ]; then
    # Add git bash-completion to shell profile
    echo '[[ -r "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]] && . "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"' >> ~/.bash_profile

    # Add fancy bash prompt when in git repos
    cat <<'    GIT' >> ~/.bash_profile
    if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
      __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
      GIT_PROMPT_ONLY_IN_REPO=1
      source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
    fi
    GIT

    # Turn off scrollbars in Terminal.app
    defaults write com.apple.Terminal AppleShowScrollBars -string WhenScrolling
    # Enable finder all files
    #   - https://setapp.com/how-to/show-hidden-files-on-mac
    defaults write com.apple.finder ApplyShowAllFiles TRUE
    killall Finder
fi
