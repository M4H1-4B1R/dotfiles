if status is-interactive
    # Commands to run in interactive sessions can go here
end

### Aliases ###

    alias ls='exa --icons'
    alias ll='exa -al --icons'
		alias snv='sudo -E -s nvim'
		alias cat='bat --theme Nord'
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

    ### Starship ###
     starship init fish | source

 set -U fish_greeting

