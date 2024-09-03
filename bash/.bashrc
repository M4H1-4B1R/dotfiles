# .bashrc

export TERM="xterm-256color"
export HISTCONTROL=ignoredups:erasedups
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export PATH="/opt/lampp/:$PATH"
export PATH="/home/abir/bin/:$PATH"
export PATH="/home/abir/.cargo/bin/:$PATH"
export PATH="/home/abir/.local/bin/:$PATH"
export PATH="$PATH":"$HOME/.local/scripts/"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

_gen_fzf_default_opts() {

  local color00='#040507'
  local color01='#3c3836'
  local color02='#504945'
  local color03='#665c54'
  local color04='#bdae93'
  local color05='#d5c4a1'
  local color06='#ebdbb2'
  local color07='#fbf1c7'
  local color08='#fb4934'
  local color09='#fe8019'
  local color0A='#fabd2f'
  local color0B='#b8bb26'
  local color0C='#8ec07c'
  local color0D='#83a598'
  local color0E='#d3869b'
  local color0F='#d65d0e'

  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS""\
 --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D""\
 --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C""\
 --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

}

_gen_fzf_default_opts

# function to fuzzy searching and killing processes
fzf_kill() {
  if [[ $(uname) == Linux ]]; then
    local pids=$(ps -f -u $USER | sed 1d | fzf | awk '{print $2}')
  elif [[ $(uname) == Darwin ]]; then
    local pids=$(ps -f -u $USER | sed 1d | fzf | awk '{print $3}')
  else
    echo 'Error: unknown platform'
    return
  fi
  if [[ -n "$pids" ]]; then
    echo "$pids" | xargs kill -9 "$@"
  fi
}

### SET VI MODE ###
# Comment this line out to enable default emacs-like bindings
# set -o vi
# bind -m vi-command 'Control-l: clear-screen'
# bind -m vi-insert 'Control-l: clear-screen'

################## Keybinds ######################
bind -s '"\C-f": "zelly\n"'

if [[ $- =~ .*i.* ]]; then bind '"\C-g": "zi \n"'; fi

# source /home/abir/.local/scripts/fzf-bash-completion.sh
# bind -x '"\t": fzf_bash_completion'
#####################################################

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
  . /usr/share/bash-completion/bash_completion

### ARCHIVE EXTRACTION
# usage: ex <file>
function ex {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
  else
    for n in "$@"; do
      if [ -f "$n" ]; then
        case "${n%,}" in
        *.cbt | *.tar.bz2 | *.tar.gz | *.tar.xz | *.tbz2 | *.tgz | *.txz | *.tar)
          tar xvf "$n"
          ;;
        *.lzma) unlzma ./"$n" ;;
        *.bz2) bunzip2 ./"$n" ;;
        *.cbr | *.rar) unrar x -ad ./"$n" ;;
        *.gz) gunzip ./"$n" ;;
        *.cbz | *.epub | *.zip) unzip ./"$n" ;;
        *.z) uncompress ./"$n" ;;
        *.7z | *.arj | *.cab | *.cb7 | *.chm | *.deb | *.dmg | *.iso | *.lzh | *.msi | *.pkg | *.rpm | *.udf | *.wim | *.xar)
          7z x ./"$n"
          ;;
        *.xz) unxz ./"$n" ;;
        *.exe) cabextract ./"$n" ;;
        *.cpio) cpio -id <./"$n" ;;
        *.cba | *.ace) unace x ./"$n" ;;
        *)
          echo "ex: '$n' - unknown archive method"
          return 1
          ;;
        esac
      else
        echo "'$n' - file does not exist"
        return 1
      fi
    done
  fi
}

### ARCHIVE EXTRACTION
# usage: ex <file>
function ex {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
  else
    for n in "$@"; do
      if [ -f "$n" ]; then
        case "${n%,}" in
        *.cbt | *.tar.bz2 | *.tar.gz | *.tar.xz | *.tbz2 | *.tgz | *.txz | *.tar)
          tar xvf "$n"
          ;;
        *.lzma) unlzma ./"$n" ;;
        *.bz2) bunzip2 ./"$n" ;;
        *.cbr | *.rar) unrar x -ad ./"$n" ;;
        *.gz) gunzip ./"$n" ;;
        *.cbz | *.epub | *.zip) unzip ./"$n" ;;
        *.z) uncompress ./"$n" ;;
        *.7z | *.arj | *.cab | *.cb7 | *.chm | *.deb | *.dmg | *.iso | *.lzh | *.msi | *.pkg | *.rpm | *.udf | *.wim | *.xar)
          7z x ./"$n"
          ;;
        *.xz) unxz ./"$n" ;;
        *.exe) cabextract ./"$n" ;;
        *.cpio) cpio -id <./"$n" ;;
        *.cba | *.ace) unace x ./"$n" ;;
        *)
          echo "ex: '$n' - unknown archive method"
          return 1
          ;;
        esac
      else
        echo "'$n' - file does not exist"
        return 1
      fi
    done
  fi
}

### Aliases ###

alias ls='exa -a --icons'
alias ll='exa -al --icons'
alias snv='sudo -E -s nvim'
alias cat='bat --theme "Catppuccin Mocha"'
alias tx='tmux'
alias txa='tmux attach'
alias hist="history | fzf"
alias fk="fzf_kill"
alias startxmp='sudo /opt/lampp/./xampp start'
alias stopxmp='sudo /opt/lampp/./xampp stop'
alias mirror='sudo reflector -c Bangladesh -c India -a 12 -p https -p http --sort rate --save /etc/pacman.d/mirrorlist'
alias ff='fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim'
alias xampp='sudo /opt/lampp/manager-linux-x64.run'
alias startapache='sudo /opt/lampp/xampp startapache'
alias startsql='sudo /opt/lampp/xampp startmysql'
alias startftp='sudo /opt/lampp/xampp startftp'
alias stopapache='sudo /opt/lampp/xampp stopapache'
alias stopsql='sudo /opt/lampp/xampp stopmysql'
alias stopftp='sudo /opt/lampp/xampp stopftp'
alias fal='alias | fzf'
alias zel='zellij'
alias asq='asciiquarium'
alias fig='figlet "Hello Reddit"'
alias r='feh --bg-fill --randomize ~/walls/'

### Debian ###
alias install='sudo apt install --no-install-recommends'
alias update='sudo apt update'
alias upgrade='sudo apt update && sudo apt upgrade'
alias listup='sudo apt --list-upgradable'
alias search='sudo apt-cache search'
alias remove='sudo apt remove'
alias purge='sudo apt purge'
alias autoremove='sudo apt autoremove'
### Arch ###
alias pac='sudo pacman'
alias orphan='sudo pacman -Qtd'
alias foreign='sudo pacman -Qm'

### Void ###
alias xbi='sudo xbps-install -S'
alias xbu='sudo xbps-install -Su'
alias xbr='sudo xbps-remove -R'
alias xbo='sudo xbps-remove -Oo'
alias xbf='sudo xbps-query -Rs'

# Starship Prompt
eval "$(starship init bash)"
#PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='[\[\e[38;5;75m\]\u\[\e[0m\]@\[\e[38;5;121m\]\H\[\e[0m\]] [\w] \[\e[38;5;168m\]${PS1_CMD1}\[\e[0m\]\n∮ '
# PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;75m\]\w \[\e[38;5;168m\]${PS1_CMD1}\[\e[0m\]\n∮ '

# Zoxide
eval "$(zoxide init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# colorscript -r
# figlet ArchLinux -c | lolcat

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                   # hh to be alias for hstr
export HSTR_CONFIG=hicolor      # get more colors
shopt -s histappend             # append new history items to .bash_history
export HISTCONTROL=ignorespace  # leading space hides commands from history
export HISTFILESIZE=10000       # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE} # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
function hstrnotiocsti {
  { READLINE_LINE="$({ </dev/tty hstr ${READLINE_LINE}; } 2>&1 1>&3 3>&-)"; } 3>&1
  READLINE_POINT=${#READLINE_LINE}
}
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind -x '"\C-r": "hstrnotiocsti"'; fi
export HSTR_TIOCSTI=n
