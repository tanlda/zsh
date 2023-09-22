# SLACK
alias sli="slack-cli"

# WARP
alias warpon="warp-cli connect"
alias warpff="warp-cli disconnect"
alias warpstt="curl https://www.cloudflare.com/cdn-cgi/trace/"

# DOCKER
alias sd='sudo docker '
function drmni() {
  sudo docker images | grep '<none>' | awk '{print $3}' | xargs -I {} sudo docker rmi {}
}