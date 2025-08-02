#!/usr/bin/env bash

echo "Installing xcode-stuff"
xcode-select --install

echo "Check for Homebrew to be present, install if it's missing"
if test ! "$(which brew)"; then
  echo "🍺 Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
else
  echo "Homebrew is already installed."
fi

echo "add Homebrew to path temporarily"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "turn brew analytics off"
brew analytics off

echo "update brew"
brew update

echo "add needed taps"
brew tap hashicorp/tap

echo "install software with Homebrew"
packages=(
  ssh-copy-id
  wget
  Kubernetes-cli
  curl
  telnet
  awscli
  tmux
  krew
  helm
  pwgen
  watch
  gnu-sed
  jq
  nmap
  pidof
  rclone
  bat
  eza
  dust
  ripgrep
  procs
  fd
  sd
  starship
  gpg
  s3cmd
  coreutils
  mcfly
  hashicorp/tap/terraform
  hashicorp/tap/packer
  chezmoi
  npm
  nvim
  gh
  pre-commit
  gitleaks
  uv
)
brew install ${packages[@]}

casks=(
  spotify
  rectangle
  ghostty
  raycast
  keepassxc
  claude-code
  claude
  chatgpt
  firefox
  google-chrome
  signal
  telegram-desktop
  thunderbird
  via
  libreoffice
  balena-etcher
)
brew install --cask ${casks[@]}

echo "cleanup brew"
brew cleanup

echo "install cdk"
/opt/homebrew/bin/npm install -g aws-cdk

echo "Check if oh-my-zsh is present, install if it's missing"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh my zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended
else
  echo "oh my zsh is already installed."
fi

echo "install LazyVim"
git clone https://github.com/LazyVim/starter ~/.config/nvim

echo "apply dotfiles"
chezmoi init git@github.com:axkng/dotfiles.git
