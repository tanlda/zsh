source ~/.nvm/nvm.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

plugins=(... virtualenv)

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
source ~/powerlevel10k/powerlevel10k.zsh-theme

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# system
alias srb="sudo reboot"

# general
alias sudo="sudo "
alias git=hub
alias g=git
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias c=clear
alias cl=clear
alias cls=clear
alias clera=clear
alias claer=clear
alias CLEAR=clear
alias C=clear

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

# bashrc
alias edtbrc='gedit ~/.bashrc'
alias refbrc='source ~/.bashrc'
alias edtzrc='gedit ~/.zshrc'
function refzrc() {
  cwd=`pwd`
  source ~/.zshrc
  cd $cwd
}
alias edtgcf='gedit ~/.gitconfig'
alias refxmod='xmodmap ~/xmodmap/.Xmodmap'
alias edtgit='gedit ~/.gitconfig'

# development
alias p=poetry
alias prs="poetry run server"
alias prss="poetry run sslserver"
alias prsh="poetry run shell"
alias prq="poetry run qcluster"
alias prc="cd src && celery -A ai_queue worker -E -l INFO -n worker-1@%h -Q test.olivia.queue.primary,test.olivia.queue.communication,test.olivia.queue.general,test.olivia.queue.adhoc,test.olivia.queue.analytics"
alias prr="poetry run rcache_usage"
alias prm="poetry run migrate"
alias prmm="poetry run makemigrations"
alias dcp=docker-compose
alias qcl="poetry run qcluster"

# django
function drs() {
  python3 src/manage.py runserver 7001
}
function drsh() {
  python3 src/manage.py shell
}
function drm() {
  python3 src/manage.py migrate
}
function drmm() {
  python3 src/manage.py makemigrations
}
function drcmd() {
  python3 src/manage.py "$@"
}

# pip
func pipupg() {
  pip install --upgrade pip
}
function pipfrz() {
  pip freeze > $1requirements.txt
}
function pipfrzb() {
  pipfrz "base/"
}

alias v="yarn dev"
alias devv="cd client && yarn dev:vite"
alias yarnv="yarn && cd client && yarn && v"
alias yv="yarn && cd client && yarn && v"

alias s="yarn serve"
alias devs="cd client && yarn serve"
alias yarns="yarn && cd client && yarn && s"
alias ys="yarn && cd client && yarn && s"

alias hdb="yarn run build:handlebars"

# override
alias gs="git status"

# specific
alias genpkt="python src/manage.py gen_pick_time_url"
alias genuifr="python src/manage.py uiframe_url"
function dropesu() {
	python src/manage.py es_index_users --company_id $1 -drop --setting=aicore.settings.development
}
alias genlang="python src/manage.py compilemessages && python src/manage.py compilejsi18n"

function slcd() {
  local valid_directories=("core" "docker" "infra" "ui")

  if [[ " ${valid_directories[*]} " == *" $1 "* ]]; then
    cd "/home/tanle/work/stackrepos/slac-$1"
  else
    echo "Available directories: ${valid_directories[*]/ /, }"
  fi
}

# SOURCES
source ~/zsh/utils.zsh
source ~/zsh/alias.zsh
source ~/zsh/git.zsh

#

# iter
function iter() {
	IFS=' ' read -A items <<< $2
	for item in "${items[@]}"
	do
	  $1 $item
	done
}

# git
function gref {
  git ccb && g co -fB _ && g br -D $(pbpaste) && g fa && g co $(pbpaste) && g br -D _
}
function greff {
  gref
  g co $(pbpaste)
  grb_
}
function grcp() {
  git branch | grep $1 | trm | pbcopy
}
function grco() {
  git branch $2 | grep $1 | trm | xargs -I {} git checkout {}
}
function grfe() {
  git branch $2 | grep $1 | trm | xargs -I {} bash -c 'git fetch --all && git fetch origin "{}":"{}"'
}
function grbD() {
  grcp $1 && g br -D $(pbpaste)
}
function grcb() {
  g co -b $1
}
function grcB() {
  grcp $1 && g co -B $(pbpaste)
}
function grb_ {
  g br -D _
}
function grrb() {
  grcp $1 && gfet $(pbpaste) && g rb $(pbpaste)
}
function glrb() {
  grcp $1 && g rb $(pbpaste)
}
function grbc() {
  g rb --continue
}
function gpsc() {
  g ccb && g ps -u $1 origin $(pbpaste)
}
function gccm {
  git log --pretty=oneline | head -1 | perl -pne 's/^(.{1,41}) (.*)$/$2/; s/\n//g' | pbcopy
}
function gccb() {
  g ccb
}
function gfco() {
	g fa && g co $1 && g pu
}
function gfet() {
  git fetch --all && git fetch origin $1:$1
}
function gresf() {
  if [[ $1 == "-c" ]];
  then
    gccm
  fi
  git reset --soft HEAD^
}
function gresh() {
  if [[ $1 == "-c" ]];
  then
    gccm
  fi
  git reset --hard HEAD^
}
function gacm() {
  g acm $1
}
function gaam() {
	g add . && g commit --amend
}
function ganm() {
  g add . && g commit -n --amend
}
function ganc() {
  g add . && g commit -n -m $1
}
function gpsf() {
	g psf
}
function grst() {
  if [[ $1 == "-f" ]];
  then
    g rst --staged .
  fi
  g rst $1
}
function grsst() {
  g rst --staged $1
  g rst $1
}
function gsta() {
  g stash apply
}
function gstl() {
  g stash list
}
function grcm {
  gresf -c && SKIP=isort g acm '$(pbpaste)'
}
function grstash() {
  gresf -c; commit=`echo $(pbpaste)`
  gccb; curr_br=`echo $(pbpaste)`
  grcp $1; target_br=`echo $(pbpaste)`
  g stash
  grco $target_br
  grcB $curr_br
  g stash apply
  if [[ $2 == "-commit" ]];
  then
	  ganc $commit
	fi
}
function gcp() {
  g cp $1
}

# git multi
function gmcp() {
  iter gcp $1
}
function gmbD() {
  iter grbD $1
}

function grconfig() {
  git config --add --local user.name "tanlda"
  git config --add --local user.email "ledinhanhtan.stack@gmail.com"
  git config --add --local core.sshCommand 'ssh -i ~/.ssh/root.pub'
  grcheck
}
function grcheck() {
  echo `git config --local user.name`
  echo `git config --local user.email`
}
function grinit() {
  g init;
  grconfig
  g acm 'initial commit';
  g br -M main
}


# docker
alias d="docker"
function dcup() {
	DOCKER_BUILDKIT=1 \
	COMPOSE_DOCKER_CLI_BUILD=1 \
	docker-compose --env-file $1 up -d \
	$(if [[ $2 == "--build" ]]; then echo $2; fi)
}
function dcdw() {
	DOCKER_BUILDKIT=1 \
	COMPOSE_DOCKER_CLI_BUILD=1 \
	docker-compose --env-file $1 down \
	$(if [[ $2 == "-v" ]]; then echo $2; fi)
}

# warp
alias warpon="warp-cli connect"
alias warpff="warp-cli disconnect"
alias warpstt="curl https://www.cloudflare.com/cdn-cgi/trace/"

# creation
function mkm() {
	mkdir $1 && cd $1 && touch "__init__.py"
}
function mkcd () {
  mkdir $1 && cd $1
}


# terraform
alias trf="terraform"

# vagrant
alias vg="vagrant"

# port
function killport() {
	sudo kill -9 `sudo lsof -t -i:$1`
}
function listport() {
  sudo lsof -i -P -n | grep LISTEN
}

# pmpn
alias pn="pnpm"

function nxgs() {
  pnpm nx generate sandbox && nxrs
}

function nxrs() {
	cd sandbox && pnpm dev
}

function nxpks() {
  PKGS=(eslint stylelint cli actions i18n const utils hooks)
  for PKG in ${PKGS[@]}
  do
    pnpm nx build $PKG
  done
}

funciton nxref() {
  rm -rf ./**/node_modules/
  pn i && cd client && pn i && cd ..
  pnpm build:ci && nxpks
  g clean -f .; g clean -df .; g rst .
  nxgs
}

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1


export PATH="$HOME/.local/bin:$PATH"

ZSH_CUSTOM=/home/tanle/.oh-my-zsh/custom

[ -f "/home/tanle/.ghcup/env" ] && source "/home/tanle/.ghcup/env" # ghcup-env