alias bexec='bundle exec'
alias brake='bundle exec rake'
alias bcap='bundle exec cap'
alias bpspec='bundle exec rake parallel:spec'
alias fullrevert='hg revert --all --no-backup'
alias predxy='ssh -N -D localhost:9000 premail_ftp'
alias prodxy='ssh -N -D localhost:9000 mail_ftp'
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

hg_prompt(){

  hg log -r . --template ' (hg {branch}:{bookmarks}) ' 2> /dev/null | sed 's/\:)/)/'
}
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\[$(tput setaf 3)\]$(hg_prompt)\[$(tput sgr0)\]\$ '

mrt(){

  if [ $# -gt 0 ] && [ $1 = "deploy" ]; then

    if [ -z `hg log -r . --template '{bookmarks}'` ]; then
      before=`hg log -r . --template '{branch}'`
    else
      before=`hg log -r . --template '{branch}:{bookmarks}'`
    fi

    if [ $# -gt 1 ]; then
      deploybookmark=":$2"
    else
      deploybookmark=''
    fi

    color_print "First name Mr, middle name 'period', last name T!" red

    print_and_run "hg update beta"
    print_and_run "hg merge -r default$deploybookmark"
    print_and_run "bundle"
    print_and_run "bundle exec rake db:migrate parallel:migrate"
    color_print "hg commit -Am 'Mr T checkpoint'"
    hg commit -Am 'Mr T checkpoint'
    print_and_run "hg push"
    print_and_run "hg push canonical -r beta"
    print_and_run "bundle exec cap deploy:cleanup deploy:update"
    print_and_run "hg update $before"
  fi
}

print_and_run(){
  color_print "$1"
  $1
}

color_print(){
  if [ $# -gt 1 ] && [ $2 = 'red' ]; then
    echo -en "\e[33;31m"
  else
    echo -en "\e[0;33m"
  fi
  echo "$1"
  echo -en "\e[1;00m"
}
