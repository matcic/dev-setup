#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# brew install node

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\\n$fmt\\n" "$@"
}

fancy_echo "Installing nvm..."
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fancy_echo "nvm installed!"
fancy_echo "Installing latest node..."
nvm install node
fancy_echo "node installed!"
nvm alias default node
fancy_echo "Installing Yarn..."
brew install yarn --without-node
fancy_echo "Yarn installed!"

# Remove outdated versions from the cellar.
brew cleanup

# npm install -g coffee-script
# npm install -g grunt-cli
# npm install -g jshint
# npm install -g less

#gem install jekyll
