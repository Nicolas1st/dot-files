HISTTIMEFORMAT="%F %T: "

get_current_branch_prefix() {
    local branch_name="$(git symbolic-ref --short -q HEAD 2> /dev/null)"
    local red='\033[0;31m'
    local reset_color='\033[0m'

    if [ -n "$branch_name" ]
    then
        echo -e "$red($branch_name)$reset_color "
    fi
}

cdg() {
  while ! [ -d .git ]
  do
      cd ..
  done
}

export LC_ALL=C
alias j="jobs -l"

alias gs="git status"
alias ga="git add"
alias gl="git log"
alias gcm="git commit --amend"
alias gc="git checkout"
alias gr="git reset"
alias gds="git diff --word-diff --staged"
alias gd="git diff"
alias gb="git branch";
alias gc="git branch";
alias gm="git mv";
commit() {
    git commit -m "$@"
}
alias c="clear"

for project in $HOME/Projects/*
do
    eval "${project##*/}=$project"
done


export LESS_TERMCAP_se=$'\e[0m'     
export LESS_TERMCAP_me=$'\e[0m'     
export LESS_TERMCAP_us=$'\e[4;93m'  
export LESS_TERMCAP_ue=$'\e[0m'     
export LESS_TERMCAP_so=$'\e[45;93m' 
export LESS_TERMCAP_md=$'\e[01;37m' 
export LESS_TERMCAP_mb=$'\e[01;31m' 

man() {
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_us=$'\e[4;93m' \
    LESS_TERMCAP_mb=$'\e[01;31m'
    LESS_TERMCAP_so=$'\e[45;93m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_me=$'\e[0m' \

    command man "$@"
}

