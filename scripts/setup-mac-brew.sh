#!/bin/bash

if ! command -v brew >/dev/null 2>&1; then
	echo "Homebrew is not installed. Installing now..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew tap homebrew/cask-fonts  # nerd-fonts
brew tap koekeishiya/formulae # yabai

formulas=(
	git
	neovim --HEAD
	tmux
	eza
	neofetch
	ripgrep
	tree
	yabai
	starship
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-autocomplete
	yazi --HEAD
	php
	ruby
	node
)

casks=(
	kitty
	hammerspoon
	balenaetcher
	intellij-idea
	movist-pro
	piclist
	squirrel
	the-unarchiver
	zoom
	cleanmymac-zh
	alfred
	torguard
	scroll-reverser
	microsoft-word
	microsoft-excel
	microsoft-powerpoint
	microsoft-teams
	microsoft-openjdk
	font-jetbrains-mono-nerd-font
	font-sarasa-gothic
)

# Install formulas
if [ ${#formulas[@]} -gt 0 ]; then
	echo "Installing formulas..."
	brew install "${formulas[@]}"
fi

# Install casks
if [ ${#casks[@]} -gt 0 ]; then
	echo "Installing casks..."
	brew install --cask "${casks[@]}"
fi

# change default config location
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

echo "All done. Yay!"
