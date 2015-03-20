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
#alias ls='ls --color=auto'

bspec(){
  if [ -z "$1" ]; then
    bundle exec spec spec
  else
    bundle exec spec $@
  fi
}


hg_at(){
  hg log -r . --template 'w/ repo' 2> /dev/null | sed 's/\:)/)/'
}

hg_prompt(){
  hg log -r . --template '{branch}:{bookmarks}' 2> /dev/null | sed 's/\:)/)/'
}

# FOR BASH
#export PS1='\n\[$(tput setaf 4)\]\u\[$(tput sgr0)\] at \[$(tput setaf 6)\]\h\[$(tput sgr0)\] in \[$(tput setaf 2)\]\w\[$(tput sgr0)\] $(hg_at) \[$(tput setaf 5)\]$(hg_prompt)\[$(tput sgr0)\]\n$ '
