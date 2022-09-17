#     ______ _        __
#    / ____/(_)_____ / /_
#   / /_   / // ___// __ \
#  / __/  / /(__  )/ / / /
# /_/    /_//____//_/ /_/
#

set fish_greeting

# PATH
fish_add_path .local/bin
fish_add_path .cargo/bin
fish_add_path .pub-cache/bin

# Neovim
set -x EDITOR nvim
set -x VISUAL nvim

#    ___     __ _
#   /   |   / /(_)____ _ _____ ___   _____
#  / /| |  / // // __ `// ___// _ \ / ___/
# / ___ | / // // /_/ /(__  )/  __/(__  )
#/_/  |_|/_//_/ \__,_//____/ \___//____/
#

# Navigation
alias ..='cd ..'
alias cd..='cd ..'

# Color
alias ls='exa --icons --color=always -a --group-directories-first'
alias ll='exa --icons --color=always -al --group-directories-first'
alias grep='rg --color=auto'

# Others
alias q='exit'
alias v='nvim'

#    ______                     __   _
#   / ____/__  __ ____   _____ / /_ (_)____   ____   _____
#  / /_   / / / // __ \ / ___// __// // __ \ / __ \ / ___/
# / __/  / /_/ // / / // /__ / /_ / // /_/ // / / /(__  )
#/_/     \__,_//_/ /_/ \___/ \__//_/ \____//_/ /_//____/
#

# Auto ls after cd
function cd
    if [ -n $argv[1] ]
        builtin cd $argv[1]
        and exa --icons --color=always -a --group-directories-first
    else
        builtin cd ~
        and exa --icons --color=always -a --group-directories-first
    end
end

# Git Clone
function g
    git clone $argv[1]
    and set git_folder (echo $argv[1] | awk -F '/' '{ print $5 }' | awk -F '.git' '{ print $1 }')
    and mv $git_folder $HOME/Development/Git/
    and cd $HOME/Development/Git/$git_folder
end

#    ____                                  __
#   / __ \ _____ ____   ____ ___   ____   / /_
#  / /_/ // ___// __ \ / __ `__ \ / __ \ / __/
# / ____// /   / /_/ // / / / / // /_/ // /_
#/_/    /_/    \____//_/ /_/ /_// .___/ \__/
#                              /_/
#

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
        echo magenta
    else
        echo red
    end
end

function fish_prompt
    set -l last_status $status

    print_in_color '['(prompt_pwd)']' cyan

    print_in_color ' ❯❯❯ ' (prompt_color_for_status $last_status)
end
