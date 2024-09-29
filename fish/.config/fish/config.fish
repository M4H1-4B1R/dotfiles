if status is-interactive
    # Commands to run in interactive sessions can go here
end
set PATH "$PATH":"$HOME/.local/scripts/"
set PATH "$PATH": "~/.nix-profile/bin"
bind \cf zelly

### Aliases ###

alias ls='exa --icons -a --no-permissions'
alias ll='exa --long --tree --level=2'
alias snv='sudo -E -s nvim'
alias cat='bat --theme catppuccin_mocha'
alias startxmp='sudo /opt/lampp/./xampp start'
alias stopxmp='sudo /opt/lampp/./xampp stop'
alias restartxmp='sudo /opt/lampp/./xampp restart'
alias tshift='sudo -E timeshift-launcher'
alias zel='zellij'
alias python='python3'
alias lvim='NVIM_APPNAME="lvim" nvim'
alias fetch="fastfetch"
alias v='nvim'
alias lgit='lazygit'
alias restore="git restore --source=HEAD --staged --worktree -- ."
alias r="feh --bg-fill --randomize ~/walls/"
alias mirror='sudo reflector -c Bangladesh -c India -a 12 -p https -p http --sort rate --save /etc/pacman.d/mirrorlist'
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
#	alias orphan='sudo pacman -Qtd'
#	alias foreign='sudo pacman -Qm'
#	alias rmall='sudo pacman -Rsunc $(pacman -Qtdq)'

### Starship ###
starship init fish | source
zoxide init fish | source

set -U fish_greeting
set -gx NVM_DIR $HOME/.nvm
bass source ~/.nvm/nvm.sh
# Created by `pipx` on 2024-06-25 07:23:06
set PATH $PATH /home/abir/.local/bin
