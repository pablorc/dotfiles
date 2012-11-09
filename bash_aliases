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

go_work(){
  if [ -z "$1" ]; then
    cd projects/Sweetspot
    gvim
  else
    cd projects/$@
    gvim
  fi
}
