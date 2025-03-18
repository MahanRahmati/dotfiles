#     ______ _        __
#    / ____/(_)_____ / /_
#   / /_   / // ___// __ \
#  / __/  / /(__  )/ / / /
# /_/    /_//____//_/ /_/
#

set fish_greeting

# ----------------------------------------------------------------------
# --                              Theme                               --
# ----------------------------------------------------------------------
function get_macos_theme
    set result (defaults read -g AppleInterfaceStyle 2>/dev/null)
    if string match -q Dark -- $result
        echo dark
    else
        echo light
    end
end

if test (get_macos_theme) = light
    fish_config theme choose "Catppuccin Latte"
else
    fish_config theme choose "Catppuccin Mocha"
end

# ----------------------------------------------------------------------
# --                               Path                               --
# ----------------------------------------------------------------------
fish_add_path .local/bin
fish_add_path /usr/local/bin/
fish_add_path .local/share/go/bin/
fish_add_path /opt/homebrew/opt/openjdk@17/bin

# ----------------------------------------------------------------------
# --                               XDG                                --
# ----------------------------------------------------------------------
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x GOPATH $HOME/.local/share/go
set -x GOMODCACHE $HOME/.cache/go/mod

# ----------------------------------------------------------------------
# --                              Neovim                              --
# ----------------------------------------------------------------------
if type -q nvim
    set -x EDITOR nvim
    set -x VISUAL nvim
    alias v='nvim'
else
    echo "Install Neovim"
end

# ----------------------------------------------------------------------
# --                               Rust                               --
# ----------------------------------------------------------------------
if type -q cargo
    fish_add_path .cargo/bin
else
    echo "Install Cargo"
end

# ----------------------------------------------------------------------
# --                               Dart                               --
# ----------------------------------------------------------------------
if type -q dart
    fish_add_path .pub-cache/bin
else
    echo "Install Dart"
end

# ----------------------------------------------------------------------
# --                                Go                                --
# ----------------------------------------------------------------------
# if type -q go
# set -x GOPATH $XDG_DATA_HOME/go
# set -x GOMODCACHE $XDG_CACHE_HOME/go/mod
# else
# echo "Install Go"
# end

# ----------------------------------------------------------------------
# --                              MacOS                               --
# ----------------------------------------------------------------------
switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/bin
        set -x CHROME_EXECUTABLE '/Applications/Chromium.app/Contents/MacOS/Chromium'
    case '*'
end

# ----------------------------------------------------------------------
# --                               Eza                                --
# ----------------------------------------------------------------------
if type -q eza
    alias ls='eza --icons --color=always -a --group-directories-first'
    alias ll='eza --icons --color=always -al --group-directories-first'
    function cd
        if [ -n $argv[1] ]
            builtin cd $argv[1]
        else
            builtin cd ~
        end
        and eza --icons --color=always -a --group-directories-first
    end
else
    echo "Install Eza"
end

# ----------------------------------------------------------------------
# --                             Ripgrep                              --
# ----------------------------------------------------------------------
if type -q rg
    alias grep='rg --color=auto'
else
    echo "Install Ripgrep"
end

# ----------------------------------------------------------------------
# --                               Git                                --
# ----------------------------------------------------------------------
if type -q git
    function g
        git clone $argv[1]
        and set git_folder (echo $argv[1] | awk -F '/' '{ print $5 }' | awk -F '.git' '{ print $1 }')
        and mv $git_folder $HOME/Development/Git/
        and cd $HOME/Development/Git/$git_folder
    end
else
    echo "Install Git"
end

# ----------------------------------------------------------------------
# --                             Aliases                              --
# ----------------------------------------------------------------------
alias ..='cd ..'
alias cd..='cd ..'
alias q='exit'

# ----------------------------------------------------------------------
# --                              Prompt                              --
# ----------------------------------------------------------------------
set fish_prompt_pwd_dir_length 1
set fish_color_command green
set fish_color_param $fish_color_normal

function print_in_color
    set -l string $argv[1]
    set -l color $argv[2]

    set_color $color
    printf $string
    set_color normal
end

function prompt_color_for_status
    if test $argv[1] -eq 0
        echo green
    else
        echo red
    end
end

function print_pwd
    printf "["
    printf (prompt_pwd)
    printf "]"
end

function fish_prompt
    set -l last_status $status
    print_pwd
    print_in_color '  ' (prompt_color_for_status $last_status)
end
