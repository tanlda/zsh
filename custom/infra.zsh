# TERRAFORM
alias trf="terraform"
alias trg="terragrunt"
function trcp() {
  trg output "$1" | sed 's/"//g' | tee >(pbcopy)
}

# VAGRANT
alias v="vagrant"

# DOCKER
alias d="docker"
function dx() {
  docker exec -it $1 ${2:-bash}
}
function drps() {
  kw="$1"
  ext="${2:-"{print \$1}"}"
  docker ps | grep "$kw" | awk "$ext"
}
function drstop() {
  drps "$1" "$2" | xargs docker stop
}

# KUBERNETES
alias kb="kubectl"
alias mkb="minikube"

function dxdb() {
  local params
  if [[ -z $1 ]]; then
    params='-Upostgres'
  fi
  dx ${2:-$POSTGRES_CTN} ${1:-psql} $params
}

function dxrd() {
  dx ${2:-$REDIS_CTN} ${1:-redis-cli}
}

# NGROK
function ngdom () {
  ngrok http --domain "${1:-thankfully-finer-urchin.ngrok-free.app}" "http://localhost:${2:-8000}"
}
