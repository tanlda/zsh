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
alias grbc="g rb --continue"
alias grba="g rb --abort"
alias grbs="g rb --skip"
alias gcp="g cp"
alias gcpc="g cp --continue"
alias gcpa="g cp --abort"
alias gcps="g cp --skip"
alias gcob="g cob"
alias gscb="g scb"

function gref() {
  cbr=`g scb`
  g cofb _
  g br -D $cbr
  g fa
  g co $cbr
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

function gpsc() {
  cbr=`g scb`
  g ps -u $1 origin $cbr
}

function grrst() {
  ccm=`g s | grep $1 | sed 's/modified://' | trm | xargs echo`
  echored $ccm
  g rst $ccm
}

function gccb() {
  gscb | xargs echo
  g ccb
}

# MULTI
function gmcp() {
  iter gcp "$@"
}
function gmbD() {
  iter grbD "$@"
}
function gmrst() {
  iter grrst "$@"
}

# CONFIG
function ginit() {
  g init
  touch .gitignore
  echo ".idea" >> .gitignore
  g acm 'initial commit'
  g br -M main
}