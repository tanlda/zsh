# SYSTEM
alias srb="sudo reboot"
function sdn() { if [[ $1 == "-f" ]]; then systemctl poweroff -i; else shutdown now $1; fi }

# BASH
alias edtb="gedit ~/.bashrc"
alias edtz="gedit ~/.zshrc"
alias edtg="gedit ~/.gitconfig"
alias refb="source ~/.bashrc"
alias refz="source ~/.zshrc"

# GENERAL
alias sudo="sudo "
alias git="hub"
alias g="git"
alias c="clear"
alias cl="clear"
alias cls="clear"
alias clera="clear"
alias claer="clear"
alias CLEAR="clear"
alias C="clear"

# XCLIP
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

# PORT
function killport() {	sudo kill -9 `sudo lsof -t -i:$1`}
function listport() { sudo lsof -i -P -n | grep LISTEN }

# WARP
alias warpon="warp-cli connect"
alias warpff="warp-cli disconnect"
alias warpstt="curl https://www.cloudflare.com/cdn-cgi/trace/"
