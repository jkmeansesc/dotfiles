# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# setup auto-complete, auto-suggestion, syntax-highlight
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_PREFIX="/opt/homebrew/"
source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme

# clean up $HOME directory
export LESSHISTFILE=/dev/null # stop .lesshst from generating
ZDOTDIR=$HOME/.config/ # move .zcompdump to .config/
HISTFILE=$HOME/.config/.zsh_history # move .zsh_history to .config/

# set EDITOR
export EDITOR='nvim'

# set $XDG PATHS
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# homebrew
export PATH="$PATH:/usr/local/bin"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# 解决ssh到远程服务器中文乱码
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# neovim
alias cn="cd ~/.config/nvim"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

## tmux
alias tn="tmux new -s"
alias tl="tmux ls"
alias td="tmux detach"
ta() {
    # Use the argument as the session name if provided, otherwise default to "WEN"
    local session_name=${1:-"WEN"}

    # Check if the session already exists
    if tmux has-session -t "$session_name" 2>/dev/null; then
        tmux attach-session -t "$session_name"
    else
        # If the session doesn't exist, create and attach to it
        tmux new-session -s "$session_name"
    fi
}

## eza
alias ll='eza -la --icons=auto --sort=name --group-directories-first' # long list
alias ls='eza -a --icons=auto' # short list
alias l='eza'
alias ld='eza -lD --icons=auto' # long list dirs

## dotfiles
alias cdd="cd $HOME/git/dotfiles"

## obsidian
alias co="cd $HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Obsidian"

## others
alias c="clear"
alias bu="sudo softwareupdate -ia --verbose; brew bundle -v --file=~/git/dotfiles/macos/Brewfile; brew cu; brew upgrade; brew bundle dump --force --file=~/git/dotfiles/macos/Brewfile --describe; brew autoremove; brew cleanup; brew doctor"
alias bi="brew bundle --verbose --force cleanup --file=~/git/dotfiles/macos/Brewfile"
alias bd="brew bundle dump --force --file=~/git/dotfiles/macos/Brewfile --describe" 

## yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# fzf
source <(fzf --zsh)

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# powerlevel10k
[[ ! -f ~/.config/.p10k.zsh ]] || source ~/.config/.p10k.zsh
