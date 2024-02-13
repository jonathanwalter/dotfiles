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
