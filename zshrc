
# -- PATH ---------------------------------------
export PATH=~/.local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/Applications/Docker.app/Contents/Resources/bin:$PATH
export PATH=/opt/homebrew/opt/libpq/bin:$PATH

export TERM=xterm-256color

# Detect architecture and change PATH accordingly
# arch=$(arch)
# echo "Arch: $arch"
# if [[ $arch == x86_64* ]] || [[ $arch == i*86 ]]; then
#   echo "Rosetta"
#   export PATH=/usr/local/bin:$HOME/.local/bin86:$PATH
# 
# elif  [[ $arch == arm* ]]; then
#   echo "M1"
#   export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.ghcup/bin:/opt/homebrew/bin:$HOME/.cargo/bin:$PATH
#   [ -f "/Users/sean/.ghcup/env" ] && source "/Users/sean/.ghcup/env" # ghcup-env
# fi

# export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.ghcup/bin:/usr/local/bin:/opt/homebrew/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loaeing at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without aasking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose direnv dotenv poetry)

source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi




[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env


GIT_INNER=".git\/."
RSYNC_IGNORE="^sent\|^total\|^building file list"
BACKUP_HIDE="$GIT_INNER\|$RSYNC_IGNORE"
alias backup-local="rsync -av --exclude-from=$HOME/code/.gitignore ~/code/ ~/Desktop/code/ | grep -v '$BACKUP_HIDE'"
alias backup-remote="rsync -av --exclude-from=$HOME/code/.gitignore ~/code/ sean@208.83.226.9:~/code/ | grep -v '$BACKUP_HIDE'"

# -- BACKUP LOCAL ---------------------------------
LAST_BACKUP="$HOME/.backup"
if [[ ! -f $LAST_BACKUP ]]; then
    echo "NONE" > $LAST_BACKUP
fi


datetime=$(date +"%Y-%m-%d %H:%M")
last="$(cat $LAST_BACKUP)"
if [ $datetime != $last ]; then
    backup-local
    echo "BACKUP ($datetime)"
    echo "$datetime" > $LAST_BACKUP
fi

# -- BACKUP REMOTE -----------------------------------
LAST_BACKUP_REMOTE="$HOME/.remote.backup"
if [[ ! -f $LAST_BACKUP_REMOTE ]]; then
    echo "NONE" > $LAST_BACKUP_REMOTE
fi

today=$(date +"%Y-%m-%d")
last="$(cat $LAST_BACKUP_REMOTE)"
if [ $today != $last ]; then
    backup-remote
    echo "BACKUP REMOTE ($today)"
    echo "$today" > $LAST_BACKUP_REMOTE
fi


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"



function thunderbolts () {ssh -t "shess@10.224.180.34" "tmux attach || tmux new";}
