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
alias gds="git diff --staged"
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

