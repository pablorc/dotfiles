alias bexec='bundle exec'
alias brake='bundle exec rake'
alias bcap='bundle exec cap'

#Make grep user friendly highlighting matches and excluding .hg folders
alias grep='grep --color=auto --exclude-dir=\.hg'

bspec(){
  if [ -z "$1" ]; then
    bundle exec spec spec
  else
    bundle exec spec $@
  fi
}

gowork(){
  local SERVER=""
  cd $HOME

  if [ $# -gt 0  ] &&  [ $1 = "-s" ]; then
    SERVER=$1
    shift
  fi

  if [ -z "$1" ]; then
    cd projects/Sweetspot
    gvim
  else
    cd projects/$1
    gvim
  fi

  if [ "$SERVER" = "-s" ]; then
    script/server
  fi
}
