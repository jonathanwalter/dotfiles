# make dir and cd into it
function mde() {
  if [ "$#" -eq "1" ]
  then
    mkdir -p $1 && cd $1
  else
    echo "Need exactly one argument"
  fi
}

# gitignore.io api
function gi() {
  curl -L -s https://www.gitignore.io/api/$@
}

function deleteline() {
  sed -i '' '${1}d' ${2}
}

function mkpw() {
  [ -z $2 ] && echo "Need parametes for lenght and quantity" && return
  cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9-_\$' | fold -w "${1}" | sed "${2}"q
}
