# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

plugins=(
  git 
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# set EDITOR
export EDITOR='nvim'

# JAVA ENV
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"

# MAVEN ENV
export MAVEN_HOME="/Users/oneoldmac/Local/apache-maven-3.9.4"

# PATH

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$PATH:/usr/local/bin"

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
  export PATH="`gem environment gemdir`/bin:$PATH"
fi

# 解决ssh到远程服务器中文乱码
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set $XDG_CONFIG_HOME
export XDG_CONFIG_HOME=$HOME/.config

# Jekyll
alias pb="bundle exec jekyll s"
alias pbd="bundle exec jekyll serve --drafts"
alias cb="cd ~/git/minicoderwen.github.io/"
alias j="bundle exec jekyll"

# Neovim
alias cn="cd ~/.config/nvim"
alias vi="nvim"
alias vim="nvim"

# Git
alias config='$(which git) --git-dir=$HOME/github/dotfiles/ --work-tree=$HOME'

## Tmux
alias tn="tmux new -s"
alias tl="tmux ls"
alias td="tmux detach"
ta() {
    local session_name="WEN"

    # Check if the session already exists
    if tmux has-session -t $session_name 2>/dev/null; then
        tmux attach-session -t $session_name
    else
        # If the session doesn't exist, create and attach to it
        tmux new-session -s $session_name
    fi
}

## eza
alias ll='eza -lh  --icons=auto' # long list
alias ls='eza -a   --icons=auto' # short list
alias l='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs

## dotfiles
alias cdd="cd $HOME/git/dotfiles"

## ChatGPT
source ~/.config/secrets.sh

# To customize prompt, run `p10k configure` or edit ~/git/dotfiles/macos/.p10k.zsh.
[[ ! -f ~/git/dotfiles/macos/.p10k.zsh ]] || source ~/git/dotfiles/macos/.p10k.zsh
