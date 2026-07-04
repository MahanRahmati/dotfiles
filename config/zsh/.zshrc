#  _____          __
# /__  /   _____ / /_
#   / /   / ___// __ \
#  / /__ (__  )/ / / /
# /____//____//_/ /_/
#

# ----------------------------------------------------------------------
# --                               Path                               --
# ----------------------------------------------------------------------
path=(~/.local/bin $path)
path+=(/usr/local/bin)
path+=(~/.local/share/go/bin)
if [[ $OSTYPE == "darwin"* ]]; then
  path+=(/opt/homebrew/opt/openjdk@17/bin)
  path+=(/opt/homebrew/opt/rustup/bin)
  path+=(/opt/homebrew/bin)
fi

typeset -U path PATH
export PATH

# ----------------------------------------------------------------------
# --                               XDG                                --
# ----------------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

# ----------------------------------------------------------------------
# --                               Zsh                                --
# ----------------------------------------------------------------------
[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh
HISTFILE="$XDG_STATE_HOME"/zsh/history

HISTSIZE=1000
SAVEHIST=1000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
zstyle :compinstall filename "$XDG_STATE_HOME"/zsh/.zshrc
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ----------------------------------------------------------------------
# --                              Neovim                              --
# ----------------------------------------------------------------------
if type nvim >/dev/null; then
  export EDITOR=nvim
  export VISUAL=nvim
  alias v='nvim'
else
  echo "Install Neovim"
fi

# ----------------------------------------------------------------------
# --                               Rust                               --
# ----------------------------------------------------------------------
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

if ! type cargo >/dev/null; then
  echo "Install Cargo"
fi
# ----------------------------------------------------------------------
# --                                Go                                --
# ----------------------------------------------------------------------
export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod

if ! type go >/dev/null; then
  echo "Install Go"
fi

# ----------------------------------------------------------------------
# --                               Dart                               --
# ----------------------------------------------------------------------
if type dart >/dev/null; then
  export PATH=$PATH:$HOME/.pub-cache/bin
else
  echo "Install Dart"
fi

# ----------------------------------------------------------------------
# --                              MacOS                               --
# ----------------------------------------------------------------------
if [[ $OSTYPE == "darwin"* ]]; then
  export CHROME_EXECUTABLE='/Applications/Chromium.app/Contents/MacOS/Chromium'
fi

# ----------------------------------------------------------------------
# --                               Eza                                --
# ----------------------------------------------------------------------
if type eza >/dev/null; then
  alias ls='eza --icons --color=always -a --group-directories-first'
  alias ll='eza --icons --color=always -al --group-directories-first'
  alias tree='eza --tree --icons --color=always -a --group-directories-first'
  chpwd() {
    eza --icons --color=always -a --group-directories-first
  }
else
  echo "Install Eza"
fi

# ----------------------------------------------------------------------
# --                             Ripgrep                              --
# ----------------------------------------------------------------------
if type rg >/dev/null; then
  alias grep='rg --color=auto'
else
  echo "Install Ripgrep"
fi

# ----------------------------------------------------------------------
# --                               Git                                --
# ----------------------------------------------------------------------
if type git >/dev/null; then
  g() {
    git clone "$1"
    local git_folder
    git_folder=$(echo "$1" | awk -F '/' '{ print $5 }' | awk -F '.git' '{ print $1 }')
    mv "$git_folder" "$HOME/Projects/Git"
    cd "$HOME/Projects/Git/$git_folder"
  }
else
  echo "Install Git"
fi

# ----------------------------------------------------------------------
# --                               NPM                                --
# ----------------------------------------------------------------------
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

# ----------------------------------------------------------------------
# --                             Aliases                              --
# ----------------------------------------------------------------------
alias ..='cd ..'
alias cd..='cd ..'
alias q='exit'
alias oc='opencode'

# ----------------------------------------------------------------------
# --                              Prompt                              --
# ----------------------------------------------------------------------
setopt PROMPT_SUBST
precmd() {
  [[ -n "$CONTAINER_ID" ]] && CONTAINER="[$CONTAINER_ID]" || CONTAINER=""
}
PROMPT='%{${CONTAINER}%}[%~]%(?.%F{green}.%F{red})  %f'

# ----------------------------------------------------------------------
# --                             Greeting                             --
# ----------------------------------------------------------------------
fastfetch
