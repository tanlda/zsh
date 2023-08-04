# ITER
function iter() {
	IFS=' ' read -A items <<< $2
	for item in "${items[@]}"
	do
	  $1 $item
	done
}

function lwc {
  tr '[:upper:]' '[:lower:]'
}
function upc {
  tr '[:lower:]' '[:upper:]'
}
function trm {
  xargs | tr -d '\n'
}
function trs {
  xargs | tr -d '[:space:]'
}

alias lwcc='xclip -out -selection primary | lwc | pbcopy'
alias upcc='xclip -out -selection primary | upc | pbcopy'
alias trmcc="xclip -out -selection primary | trm | pbcopy"

function coecho() {
  local color=${2:-"\033[0;31m"}
  echo -e "$color$1"
}

function echored() { coecho "$1" "\033[0;31m" }
function echogre() { coecho "$1" "\033[0;32m" }
function echoyel() { coecho "$1" "\033[0;33m" }
function echoblu() { coecho "$1" "\033[0;34m" }
function echopur() { coecho "$1" "\033[0;35m" }
function echocya() { coecho "$1" "\033[0;36m" }
function echowhi() { coecho "$1" "\033[0;37m" }
