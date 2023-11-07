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
