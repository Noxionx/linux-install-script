##################################### ZSH #####################################


#########
# Path : oh-my-zsh installation
#########

export ZSH=/opt/oh-my-zsh


#########
# Theme : Set name of the theme to load (in $ZSH/themes/)
#########

ZSH_THEME="robbyrussell"


#########
# Plugins : Which plugins would you like to load? (plugins can be found in $ZSH/plugins/*)
#########

plugins=(git)


#########
# Local Profile
#########

export PROFILE=~/.profile
source $PROFILE


#########
# Load oh-my-zsh
#########

source $ZSH/oh-my-zsh.sh