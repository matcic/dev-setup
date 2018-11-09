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

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
#brew install ringojs
#brew install narwhal

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
#brew install ruby-build
#brew install rbenv
#LINE='eval "$(rbenv init -)"'
#grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install homebrew/x11/xpdf
brew install xz

# Install other useful binaries.
# Search tool like grep, but optimized for programmers
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
# Git extension for versioning large files
brew install git-lfs
# Extensions to follow Vincent Driessen's branching model
brew install git-flow
# Small git utilities
brew install git-extras
# Add GitHub support to git on the command-line
brew install hub
# Tools and libraries to manipulate images in many formats
brew install imagemagick --with-webp
# Powerful, lightweight programming language
#brew install lua
# Text-based web browser
#brew install lynx
# 7-Zip (high compression file archiver) implementation
brew install p7zip
# Parallel gzip
brew install pigz
# Monitor data's progress through a pipe
brew install pv
# Perl-powered file rename script with many helpful built-ins
brew install rename
# JavaScript engine
#brew install rhino
# Command-line interface for https://speedtest.net bandwidth tests
brew install speedtest_cli
# Add a public key to a remote machine's authorized_keys file
brew install ssh-copy-id
# Display directories as trees (with optional color/HTML output)
brew install tree
# Create screenshots of webpages from the terminal
brew install webkit2png
# New zlib (gzip, deflate) compatible compressor
brew install zopfli
brew install pkg-config libffi
# Swiss-army knife of markup format conversion
brew install pandoc

# Lxml and Libxslt
# GNOME XML library
brew install libxml2
# C XSLT library for GNOME
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Install Heroku
brew install heroku/brew/heroku
heroku update

# Core casks
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" xquartz

# Development tool casks
#brew cask install --appdir="/Applications" sublime-text
#brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" virtualbox
#brew cask install --appdir="/Applications" vagrant
# Markdown editor
brew cask install --appdir="/Applications" macdown

# Misc casks
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" dropbox
#brew cask install --appdir="/Applications" evernote
#brew cask install --appdir="/Applications" 1password
#brew cask install --appdir="/Applications" gimp
#brew cask install --appdir="/Applications" inkscape
brew cask install --appdir="/Applications" istat-menus
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" spectacle
brew cask install --appdir="/Applications" gitkraken
#Remove comment to install LaTeX distribution MacTeX
#brew cask install --appdir="/Applications" mactex

# Install Docker, which requires virtualbox
brew install docker docker-compose
#brew install boot2docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup