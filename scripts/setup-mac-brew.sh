#!/bin/bash

brew tap homebrew/cask-fonts # nerd-fonts
brew tap koekeishiya/formulae # yabai

# Essentials
brew install --formula git
brew install --formula neovim --HEAD
brew install --formula tmux
brew install --cask iterm2
brew install --cask firefox

# Fonts
brew install --cask font-hack-nerd-font
brew install --cask font-sarasa-gothic

# Useful tools
brew install --formula eza
brew install --formula neofetch
brew install --formula ripgrep
brew install --formula tree
brew install --formula yabai


# Dev tools
brew install --formula php
brew install --formula ruby
brew install --formula node
brew install --cask microsoft-openjdk

# Apps
brew install --cask alfred
brew install --cask balenaetcher
brew install --cask intellij-idea
brew install --cask movist-pro
brew install --cask piclist
brew install --cask squirrel
brew install --cask the-unarchiver
brew install --cask zoom
brew install --cask cleanmymac-zh
brew install --cask tailscale

# Microsoft office
brew install --cask microsoft-outlook
brew install --cask microsoft-word
brew install --cask microsoft-excel
brew install --cask microsoft-powerpoint

