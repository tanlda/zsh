MYSQL_USR=
MYSQL_PWD=

function mysqlx() {
  ctn=$1
  stmt=$2
  usr=${3:-$MYSQL_USR}
  pwd=${4:-$MYSQL_PWD}
  docker exec "$ctn" sh -c "export MYSQL_PWD=$pwd; mysql -u $usr -e \"$stmt\""
}

function dxsql() {
  ctn=$1
  stmt=$2
  usr=${3:-$MYSQL_USR}
  pwd=${4:-$MYSQL_PWD}
  docker exec -it "$ctn" sh -c "export MYSQL_PWD=$pwd; mysql -u $usr"
}
