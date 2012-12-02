[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM
set EDITOR=vim

export DOTBASH=~/.git_bash
source ~/.git-completion.bash
source $DOTBASH/main.sh
export PS1="\u@\h \w\[$txtcyn\]\$git_branch\[$txtrst\]\$ "
export SERVICES_ENV=local
alias ap="cd ~/Projects/Galileo/auth-platform/auth-platform-webapp"
alias dp="cd ~/Projects/Galileo/auth-devportal/auth-devportal-webapp"
alias ae="cd ~/Projects/Galileo/auth-editors"
alias simplecard="cd ~/Projects/Galileo/simplecard/simplecard-webapp"
alias gto="cd ~/Projects/Galileo/galileo-test-objects"
alias sdk="cd ~/Projects/Galileo/galileo-sdk"
alias reload="source ~/.bash_profile"
alias todo="vim ~/Notes/todo"
alias note="vim ~/Notes/current_notes"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
