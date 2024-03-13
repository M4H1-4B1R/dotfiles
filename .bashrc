# .bashrc

export PATH="/opt/lampp/:$PATH"
export PATH="/home/xero/bin/:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
### Aliases ###

alias ls='exa --icons'
alias ll='exa -al --icons'
alias snv='sudo -E -s nvim'
alias cat='batcat --theme Nord'
alias nfetch='neofetch --ascii_distro arch'
alias tx='tmux'
alias txa='tmux attach'
alias ff='fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim'

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
alias pac='sudo pacman -S'
alias pacup='sudo pacman -Syu'
alias pacrm='sudo pacman -Rns'
alias pacfind='sudo pacman -Ss'
alias paclist='sudo pacman -Qq'
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

# colorscript
colorscript -e fade

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
