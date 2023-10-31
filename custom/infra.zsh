# TERRAFORM
alias trf="terraform"
alias trg="terragrunt"

# VAGRANT
alias v="vagrant"

# DOCKER
alias d="docker"
alias dx="docker exec -it "

# NGROK
function ngdom () {
  ngrok http --domain "${1:-thankfully-finer-urchin.ngrok-free.app}" "http://localhost:${2:-8000}"
}
