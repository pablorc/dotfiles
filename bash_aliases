alias bexec='bundle exec'
alias brake='bundle exec rake'
alias bcap='bundle exec cap'
alias bpspec='bundle exec rake parallel:spec'
alias fullrevert='hg revert --all --no-backup'
alias prodxy='ssh -N -D localhost:9000 amazon'
alias clipit='xclip -sel clip < '

#Make grep user friendly highlighting matches and excluding .hg folders
alias grep='grep --color=auto --exclude-dir=\.hg'
alias ls='ls --color=auto'

bspec(){
  if [ -z "$1" ]; then
    bundle exec spec spec
  else
    bundle exec spec $@
  fi
}

wtime(){
  local SERVER=""
  cd $HOME

  echo "What time is it???"
  echo "           WORKING"
  echo "              TIME"

  if [ $# -gt 0  ] &&  [ $1 = "-s" ]; then
    SERVER=$1
    shift
  fi

  if [ -z "$1" ]; then
    cd projects/Sweetspot
  else
    cd projects/$1
  fi

  gvim

  if [ "$SERVER" = "-s" ]; then
    script/server
  fi
}
