#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen


# Install PHP and tools
brew install homebrew/php/php70 --with-gmp
brew install homebrew/php/php70-intl
brew install homebrew/php/php70-mcrypt
brew install homebrew/php/php70-memcached
brew install homebrew/php/php70-opcache
brew install homebrew/php/php-cs-fixer
brew install homebrew/php/php-code-sniffer
brew install mysql
brew install nginx


#Install casks
brew cask install sublime-text
brew cask install google-chrome
brew cask install sequel-pro
brew cask install iterm2
brew cask install slack
brew cask install spectacle
brew cask install diffmerge
brew cask install sourcetree

# Remove outdated versions from the cellar.
brew cleanup
