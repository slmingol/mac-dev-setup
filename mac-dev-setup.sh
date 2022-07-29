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

# Temporarily disable gatekeeper to prevent installations from failing
sudo spctl --master-disable

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
  #adoptopenjdk8
  ansible
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
)
for pkg in ${BREW_PKGS[@]};do brew_pkg $pkg;done

# Install casks
BREW_CASKS=(
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
)
for cask in ${BREW_CASKS[@]};do brew_cask $cask;done

# Install taps
# FORMAT: <tap_url_or_github_repo>,<pkg_name>
BREW_TAPS=(
  drone/drone,drone
  jmespath/jmespath,jp
  johanhaleby/kubetail,kubetail
  jeffreywildman/homebrew-virt-manager,virt-viewer
  #AdoptOpenJDK/openjdk,adoptopenjdk8
  AdoptOpenJDK/openjdk,adoptopenjdk11
  instrumenta/instrumenta,kubeval
  jmainguy/tap/ghreports
  hakky54/crip
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
sudo spctl --master-enable
sudo spctl --add /Applications/Visual\ Studio\ Code.app
sudo spctl --add /Applications/VirtualBox.app

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
