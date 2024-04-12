# setup auto-complete, auto-suggestion, syntax-highlight
export HOMEBREW_PREFIX="/opt/homebrew/"
source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# clean up $HOME directory
export LESSHISTFILE=/dev/null # stop .lesshst from generating
ZDOTDIR=$HOME/.config/ # move .zcompdump to .config/
HISTFILE=$HOME/.config/.zsh_history # move .zsh_history to .config/

# set EDITOR
export EDITOR='nvim'

# set $XDG_CONFIG_HOME
export XDG_CONFIG_HOME=$HOME/.config

# homebrew
export PATH="$PATH:/usr/local/bin"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# ruby
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
  export PATH="`gem environment gemdir`/bin:$PATH"
fi

# nodejs
export NPM_CONFIG_CACHE="$HOME/.local/share/npm/cache"
export NPM_CONFIG_PREFIX="$HOME/.local/share/npm"
export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"

# 解决ssh到远程服务器中文乱码
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# jekyll
alias pb="bundle exec jekyll s"
alias pbd="bundle exec jekyll serve --drafts"
alias cb="cd ~/git/jkmeansesc.github.io/"
alias j="bundle exec jekyll"

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
alias ll='eza -lh  --icons=auto' # long list
alias ls='eza -a   --icons=auto' # short list
alias l='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs

## dotfiles
alias cdd="cd $HOME/git/dotfiles"

## ChatGPT
source ~/.config/secrets.sh

## others
alias c="clear"

# initialize starship
eval "$(starship init zsh)"
