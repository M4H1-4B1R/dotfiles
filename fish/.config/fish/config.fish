if status is-interactive
    # Commands to run in interactive sessions can go here
end
set PATH "$PATH":"$HOME/.local/scripts/"
set PATH "$PATH": "~/.nix-profile/bin"
bind \cf zelly
bind \ce dotsearch

### Aliases ###

alias ls='exa --icons -a --no-permissions'
alias ll='exa -la'
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
alias mirror='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias matlab='/home/abir/matlab/bin/matlab -softwareopengl'
alias bls="betterlockscreen -u"
alias hx="helix"

# This will generate a list of explicitly installed packages
alias list="sudo pacman -Qqe"
#This will generate a list of explicitly installed packages without dependencies
alias listt="sudo pacman -Qqet"
# list of AUR packages
alias listaur="sudo pacman -Qqem"
# add > list at the end to write to a file

alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
alias ytv-7="yt-dlp -S res:720"

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
#grub issue 08/2022
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ArcoLinux"

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
