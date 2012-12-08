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
# DISABLE_AUTO_UPDATE="true"

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
export PATH="$HOME/.rbenv/bin:$PATH"


foreground-vi() {
  fg %vi
}

zle -N foreground-vi
bindkey '^Z' foreground-vi

