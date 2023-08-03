# PARADOX
alias prc="cd src && celery -A ai_queue worker -E -l INFO -n worker-1@%h -Q test.olivia.queue.primary,test.olivia.queue.communication,test.olivia.queue.general,test.olivia.queue.adhoc,test.olivia.queue.analytics"

alias genpkt="python src/manage.py gen_pick_time_url"
alias genuifr="python src/manage.py uiframe_url"
function dropesu() {
	python src/manage.py es_index_users --company_id $1 -drop --setting=aicore.settings.development
}
alias genlang="python src/manage.py compilemessages && python src/manage.py compilejsi18n"


function nxgs() { pnpm nx generate sandbox && nxrs }
function nxrs() { cd sandbox && pnpm dev }
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

alias hdb="yarn run build:handlebars"

# SLAC
function slcd() {
  local valid_directories=("core" "docker" "infra" "ui")

  if [[ " ${valid_directories[*]} " == *" $1 "* ]]; then
    cd "/home/tanle/work/stackrepos/slac-$1"
  else
    echo "Available directories: ${valid_directories[*]/ /, }"
  fi
}
