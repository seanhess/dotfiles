# Color
export CLICOLOR=1;

# Path
export PATH=~/bin:~/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/octave/3.8.0/bin:$PATH
#export PATH=~/.cabal/bin:/Users/seanhess/Library/Haskell/bin:$PATH
#Add GHC 7.8.3 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.3.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# Tab Names
export PROMPT_COMMAND='echo -ne "\033]0;$(basename $PWD)\007"'

export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
export SCALA_HOME="/Users/seanhess/local"

#export EDITOR=vi crontab -e

source ~/bin/git-completion.bash
alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
#alias inkscape="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"

source ~/bin/services.sh
source ~/bin/servers.sh
source ~/bin/commands.sh
source ~/bin/tunnels.sh
# source ~/bin/z.sh

source ~/.nvm/nvm.sh

source ~/.aws_auth


#alias mocha="node_modules/.bin/mocha -R spec --compilers coffee:coffee-script"

export PS1="\W> "
#export PS1="> "

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


eval "$(grunt --completion=bash)"

# enable ls **/*.text
# shopt -s globstar
