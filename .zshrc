# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="candy"

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
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/anthonycapone/.rvm/bin:/Users/anthonycapone/.meteor

set EDITOR=vi
export SERVICES_ENV=local

alias reload="source ~/.zshrc"
alias todo="vim ~/Notes/todo"
alias note="vim ~/Notes/current_notes"
alias b="popd"
alias step="cd ~/Projects/step-io"
alias projects="cd ~/Projects"
alias pgs="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg="psql -d postgres"
alias fb="cd ~/projects/fundbase"

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
export OPENEXCHANGERATES_API_KEY="4d46391983ba492299e555fd57f2229f"

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

transfer() {
    # write to output to tmpfile because of progress bar
    tmpfile=$( mktemp -t transferXXX )
    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
    head -2 $tmpfile | pbcopy
    cat $tmpfile;
    echo "URL Copied To Clipboard"
    rm -f $tmpfile;
}

alias transfer=transfer

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export R_HOME="/Library/Frameworks/R.framework/Resources"

export SLACK_API_TOKEN='xoxp-14090043810-130658332128-132371715073-67ea2619af4a18c8c4f7fc707851c725'
