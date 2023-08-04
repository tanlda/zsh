# ALIAS
alias git="hub"
alias g="git"
alias gs="git status"
alias gacm="g acm"
alias gaam="g aam"
alias ganm="g anm"
alias gpsf="g psf"
alias grst="g rst"
alias gstl="g stash list"
alias gsta="g stash apply"
alias gstp="g stash pop"
alias gstc="g stash clear"
alias grbc="g rb --continue"
alias grba="g rb --abort"
alias grbs="g rb --skip"
alias gcp="g cp"
alias gcpc="g cp --continue"
alias gcpa="g cp --abort"
alias gcps="g cp --skip"

function gref() {
  cbr=`g pcb`
  g cofb _
  g br -D $cbr
  g fa
  g co -b $cbr
  g br -D _
}

function grcb() {
  g br | grep $1 | trm | pbcopy
}

function grpb() {
  g br | grep $1 | trm | xargs echo
}

function grco() {
  tbr=`grpb $1`
  g co $tbr
}

function grcB() {
  tbr=`grpb $1`
  g co -B $tbr
}

function gfco() {
  g fa && g co $1 && g pu
}

function grfe() {
  g br | grep $1 | trm | xargs -I {} bash -c 'g fa && g fetch origin "{}:{}"'
}

function gfet() {
  g fa && g fetch origin $1:$1
}

function grrb() {
  cbr=`grpb $1` &&
  gfet $cbr &&
  g rb $cbr
}

function glrb() {
  cbr=`grpb $1` &&
  g rb $cbr
}

function grbD() {
  g br -D `grpb $1`
}

function grb_() {
  grbD _
}

function gccm {
  git log --pretty=oneline | head -1 | perl -pne 's/^(.{1,41}) (.*)$/$2/; s/\n//g' | pbcopy
}

function gresf() {
  if [[ $1 == "-c" ]]; then gccm; fi
  g resh
}

function gresh() {
  if [[ $1 == "-c" ]]; then gccm; fi
  g reshh
}

function gpsc() {
  cbr=`g pcb`
  g ps -u $1 origin $cbr
}

function grrst() {
  ccm=`g s | grep $1 | sed 's/modified://' | trm | xargs echo`
  echored $ccm
  g rst $ccm
}

# MULTI
function gmcp() { iter gcp $1 }
function gmbD() { iter grbD $1 }
function gmrst() { iter grrst $1 }

# CONFIG
function grcheck() {
  echo `git config --local user.name`
  echo `git config --local user.email`
  echo `git config --local core.sshCommand`
}
function grconfig() {
  git config --add --local user.name "tanlda"
  git config --add --local user.email "ledinhanhtan.stack@gmail.com"
  git config --add --local core.sshCommand 'ssh -i ~/.ssh/root.pub'
  grcheck
}
function grinit() {
  g init
  grconfig
  g acm 'initial commit'
  g br -M main
}