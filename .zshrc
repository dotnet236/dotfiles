# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="prose"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all


# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/acapone/.rvm/bin

set EDITOR=vi
export SERVICES_ENV=local

#export DOTBASH=~/.git_bash
#source ~/.git-completion.bash
#source $DOTBASH/main.sh
#export PS1="\u@\h \w\[$txtcyn\]\$git_branch\[$txtrst\]\$ "
alias ap="cd ~/Projects/Galileo/auth-platform/auth-platform-webapp"
alias dp="cd ~/Projects/Galileo/auth-devportal/auth-devportal-webapp"
alias ae="cd ~/Projects/Galileo/auth-editors"
alias simplecard="cd ~/Projects/Galileo/simplecard/simplecard-webapp"
alias gto="cd ~/Projects/Galileo/galileo-test-objects"
alias sdk="cd ~/Projects/Galileo/galileo-sdk"
alias reload="source ~/.bash_profile"
alias todo="vim ~/Notes/todo"
alias note="vim ~/Notes/current_notes"
alias b="popd"
alias step="cd ~/Projects/step-io"
alias projects="cd ~/Projects"
alias pgs="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg="psql -d postgres"

alias stash="git stash"
alias glcm="git log -1 --pretty=%B"

# git diff..
alias gd='git diff'
alias gdc='git diff --cached'

# git status..
alias gs='git status --short'

# git fetch..
alias gf='git fetch'
alias gfo='git fetch origin'
alias gfa='git fetch --all'

#
alias glog='git log --date-order --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias gl='glog --graph'

# git merge
alias gm='git merge --no-ff --log'

# git mv
alias gmv='git mv'

# git rm
alias grm='git rm'

# git reset..
alias grod='git reset --hard origin/development'
alias grom='git reset --hard origin/master'
alias groi='git reset --hard origin/integration'
alias gror='git reset --hard origin/release'

# git checkout..
alias gcod='git checkout development'
alias gcoi='git checkout integration'
alias gcom='git checkout master'
alias gcor='git checkout release'

# git diff..
alias gdoi='git diff origin/integration'
alias gdod='git diff origin/development'
alias gdom='git diff origin/master'

export PATH="$PATH:/usr/local/share/npm/bin"


foreground-vi() {
  fg %vi
}

zle -N foreground-vi
bindkey '^Z' foreground-vi

imv() {
  local src dst
  for src; do
    [[ -e $src ]] || { print -u2 "$src does not exist"; continue }
    dst=$src
    vared dst
    [[ $src != $dst ]] && mkdir -p $dst:h && mv -n $src $dst
  done
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by travis gem
source /Users/acapone/.travis/travis.sh
