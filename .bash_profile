[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM 
set $EDITOR=vim

export DOTBASH=~/.git_bash
source $DOTBASH/main.sh
export PS1="\u@\h \w\[$txtcyn\]\$git_branch\[$txtrst\]\$ "
