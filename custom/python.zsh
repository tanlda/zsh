# PIP
alias pipup="pip install --upgrade pip"
function pipfrz() { pip freeze > $1requirements.txt }
function pipfrzb() { pipfrz "base/" }

# POETRY
alias p="poetry"
alias prs="poetry run server"
alias prss="poetry run sslserver"
alias prm="poetry run migrate"
alias prmm="poetry run makemigrations"
alias prsh="poetry run shell"
alias prr="poetry run rcache_usage"
alias qcl="poetry run qcluster"

# DJANGO
function drs() { python3 src/manage.py runserver {$1:-8000} }
function drsh() { python3 src/manage.py shell }
function drm() { python3 src/manage.py migrate }
function drmm() { python3 src/manage.py makemigrations }
function drcmd() { python3 src/manage.py "$@" }

