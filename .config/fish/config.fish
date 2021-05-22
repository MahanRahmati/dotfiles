# https://www.coolgenerator.com/ascii-text-generator
# Slant Default Default

#-----------------------#
#     _______      __   #
#    / ____(_)____/ /_  #
#   / /_  / / ___/ __ \ #
#  / __/ / (__  ) / / / #
# /_/   /_/____/_/ /_/  #
#                       #
#-----------------------#

set fish_greeting

# Language Default
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# PATH
set -x PATH '$HOME/.local/bin' $PATH

# NeoVim
set -x EDITOR 'nvim'
set -x VISUAL 'nvim'
set -x MANPAGER 'nvim -c "set ft=man" -'

# Browser
set -x BROWSER 'librewolf'

# XDG
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"

set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -x LESSHISTFILE "-"
set -x WINEPREFIX "$XDG_DATA_HOME/wineprefixes/default"

set -x CUDA_CACHE_PATH "$XDG_DATA_HOME/nv"
set -x __GL_THREADED_OPTIMIZATION "1"
set -x __GL_SHADER_CACHE "1"
set -x __GL_SHADER_DISK_CACHE "1"
set -x __GL_SHADER_DISK_CACHE_PATH "$XDG_DATA_HOME/nv"
set -x __GL_SHADER_DISK_CACHE_SKIP_CLEANUP "1"

#-------------------------------------#
#     ___    ___                      #
#    /   |  / (_)___ _________  _____ #
#   / /| | / / / __ `/ ___/ _ \/ ___/ #
#  / ___ |/ / / /_/ (__  )  __(__  )  #
# /_/  |_/_/_/\__,_/____/\___/____/   #
#                                     #
#-------------------------------------#

# Navigation
alias ..='cd ..'
alias cd..='cd ..'

# Color
alias ls='exa --icons --color=always -a --group-directories-first'
alias ll='exa --icons --color=always -al --group-directories-first'
alias grep='grep --color=auto'

# Internet
alias ping='ping archlinux.org'

# Flags
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias free='free -mt'
alias mkdir='mkdir -pv'

# Others
alias q='exit'
alias v='nvim'

# Arch
alias orphan='sudo pacman -Rns (pacman -Qtdq)'
alias update='sudo pacman -Syyu'
alias aur='yay -Sua'

#---------------------------------------------------#
#     ______                 __  _                  #
#    / ____/_  ______  _____/ /_(_)___  ____  _____ #
#   / /_  / / / / __ \/ ___/ __/ / __ \/ __ \/ ___/ #
#  / __/ / /_/ / / / / /__/ /_/ / /_/ / / / (__  )  #
# /_/    \__,_/_/ /_/\___/\__/_/\____/_/ /_/____/   #
#                                                   #
#---------------------------------------------------#

# Backup File
function backup --argument filename
	cp $filename $filename.bak
end

# Extract Archives
function extract
	if test (count $argv) -ne 1
    echo 'Error: No file specified.'
    return 1
  end
  set -l f $argv
  if test -f $f
    switch $f
      case '*.tar.bz2'
        tar xvjf $f
      case '*.tar.gz'
        tar xvzf $f
      case '*.bz2'
        bunzip2 $f
      case '*.rar'
        unrar x $f
      case '*.gz'
        gunzip $f
      case '*.tar'
        tar xvf $f
      case '*.tbz2'
        tar xvjf $f
      case '*.tgz'
        tar xvzf $f
      case '*.zip'
        unzip $f
      case '*.Z'
        uncompress
      case '*.7z'
        7z x $f
      case '*'
        echo '"$f" cannot be extracted'
    end
  else
    echo '"$f" is not a valid file'
  end
end

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

# History
function history
	builtin history --show-time='%F %T '
end

# Git Clone
function g
	git clone $argv[1]
	and set git_folder (echo $argv[1] | awk -F '/' '{ print $5 }' | awk -F '.git' '{ print $1 }')
	and mv $git_folder $HOME/Development/Git/
	and cd $HOME/Development/Git/$git_folder
end

#------------------------------------------------------------------------#
#    ______           __                  _             __  _            #
#   / ____/_  _______/ /_____  ____ ___  (_)___  ____ _/ /_(_)___  ____  #
#  / /   / / / / ___/ __/ __ \/ __ `__ \/ /_  / / __ `/ __/ / __ \/ __ \ #
# / /___/ /_/ (__  ) /_/ /_/ / / / / / / / / /_/ /_/ / /_/ / /_/ / / / / #
# \____/\__,_/____/\__/\____/_/ /_/ /_/_/ /___/\__,_/\__/_/\____/_/ /_/  #
#                                                                        #
#------------------------------------------------------------------------#

# Fetch
set user (id -un || printf %s {HOME/*\/})
set host_name (hostname -f)
set os (lsb_release -a | grep Description | cut -c 14-23)
set product_name (cat /sys/devices/virtual/dmi/id/product_name)
set kernel (uname -r)
set uptime (uptime -p | cut -c 3-30)
set packages (pacman -Q | wc -l)

function _colored_print
  set -l string_1 $argv[1]
  set -l string_2  $argv[2]

  set_color cyan
  printf $string_1
  set_color normal
  echo $string_2
end

function fetch
	set_color cyan
	printf ' '$user
	set_color normal
	printf '@'
	set_color cyan
	echo $host_name
	set_color normal
	echo ' ------------------------ '
	_colored_print ' OS' ': '$os
	_colored_print ' Host' ': '$product_name
	_colored_print ' Kernel' ': '$kernel
	_colored_print ' Uptime' ':'$uptime
	_colored_print ' Packages' ': '$packages' (pacman)'
	echo ' ------------------------ '
	printf '\e[0m '
	printf '\033[0;40m   '
	printf '\033[0;41m   '
	printf '\033[0;42m   '
	printf '\033[0;43m   '
	printf '\033[0;44m   '
	printf '\033[0;45m   '
	printf '\033[0;46m   '
	printf '\033[0;47m   '
	echo ''
	printf '\e[0m '
	printf '\033[0;100m   '
	printf '\033[0;101m   '
	printf '\033[0;102m   '
	printf '\033[0;103m   '
	printf '\033[0;104m   '
	printf '\033[0;105m   '
	printf '\033[0;106m   '
	echo -e '\033[0;107m   '
	echo -e '\e[0m ------------------------ '
end

fetch

# Prompt
set fish_prompt_pwd_dir_length 1

set fish_color_command green
set fish_color_param $fish_color_normal

function print_in_color
  set -l string $argv[1]
  set -l color  $argv[2]

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

function fish_right_prompt
  print_in_color '['(date +"%T")']' blue
end
