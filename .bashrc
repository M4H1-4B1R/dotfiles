# .bashrc

export PATH="/opt/lampp/:$PATH"
export PATH="/home/xero/bin/:$PATH"
export PATH="/home/xero/.local/bin/:$PATH"
export PATH="$PATH":"$HOME/.local/scripts/"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind -s '"\C-f": "tmux-sessionizer\n"'
### Aliases ###

    alias ls='exa --icons'
    alias ll='exa -al --icons'
    alias snv='sudo -E -s nvim'
    alias cat='bat --theme Nord'
		alias nfetch='neofetch --ascii_distro arch'
		alias tx='tmux'
		alias txa='tmux attach'
    alias mirror='sudo reflector -c Bangladesh -c India -a 12 -p https -p http --sort rate --save /etc/pacman.d/mirrorlist'
    alias ff='fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim'
    alias xampp='sudo /opt/lampp/manager-linux-x64.run'
    alias startapache='sudo /opt/lampp/xampp startapache'
    alias startsql='sudo /opt/lampp/xampp startmysql'
    alias startftp='sudo /opt/lampp/xampp startftp'
    alias stopapache='sudo /opt/lampp/xampp stopapache'
    alias stopsql='sudo /opt/lampp/xampp stopmysql'
    alias stopftp='sudo /opt/lampp/xampp stopftp'

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
     
PS1='[\u@\h \W]\$ '

# Starship Prompt
eval "$(starship init bash)"

# Zoxide
eval "$(zoxide init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
