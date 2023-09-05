# PIP
alias pipup="pip install --upgrade pip"
function pfrz() {
  pip freeze > $1requirements.txt
}

function pfrzb() {
  if [[ $1 == "-s" ]]; then
    pip freeze > ~/work/stackrepos/slac-core/requirements/base.txt
  else
    pip freeze > requirements/base.txt
  fi
}

# POETRY
alias p="poetry"
alias prs="poetry run server"
alias prss="poetry run sslserver"
alias prm="poetry run migrate"
alias prmm="poetry run makemigrations"
alias prsh="poetry run shell"
alias prr="poetry run rcache_usage"
alias prq="poetry run qcluster"

# DJANGO
alias mng="python3 manage.py"
alias mngt="python3 manage.py test"
function dasa() { django-admin startapp --template template $1 }

function drs() { python3 src/manage.py runserver {$1:-8000} }
function drsh() { python3 src/manage.py shell }
function drm() { python3 src/manage.py migrate }
function drmm() { python3 src/manage.py makemigrations }
function drcmd() { python3 src/manage.py "$@" }

# UNITTEST
alias puni="python -m unittest"

# JUPYTER
alias jp="jupyter"