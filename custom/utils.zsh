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