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
path+=(usr/local/bin)
path+=(~/.local/share/go/bin)
if [[ $OSTYPE == "darwin"* ]]; then
  path+=(/opt/homebrew/opt/openjdk@17/bin)
  path+=(/opt/homebrew/opt/rustup/bin)
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
# --                               ZSH                                --
# ----------------------------------------------------------------------
HISTSIZE=1000
SAVEHIST=1000

[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh
HISTFILE="$XDG_STATE_HOME"/zsh/history

zstyle :compinstall filename "$XDG_STATE_HOME"/zsh/.zshrc

autoload -Uz compinit
compinit

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
  export PATH=$PATH:$HOME/.pub-cache/bin
  export CHROME_EXECUTABLE='/Applications/Chromium.app/Contents/MacOS/Chromium'
fi

# ----------------------------------------------------------------------
# --                               Eza                                --
# ----------------------------------------------------------------------
if type eza >/dev/null; then
  alias ls='eza --icons --color=always -a --group-directories-first'
  alias ll='eza --icons --color=always -al --group-directories-first'
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
# --                             Aliases                              --
# ----------------------------------------------------------------------
alias ..='cd ..'
alias cd..='cd ..'
alias q='exit'

# ----------------------------------------------------------------------
# --                              Prompt                              --
# ----------------------------------------------------------------------
setopt PROMPT_SUBST

prompt_pwd() {
  printf "[%s]" "%~"
}

prompt_color_for_status() {
  if [ "$1" -eq 0 ]; then
    printf '%s' '%F{green}'
  else
    printf '%s' '%F{red}'
  fi
}

PROMPT='$(prompt_pwd)$(prompt_color_for_status $?)  %f '

# ----------------------------------------------------------------------
# --                             Greeting                             --
# ----------------------------------------------------------------------
fastfetch
