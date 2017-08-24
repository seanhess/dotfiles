# Color
export CLICOLOR=1;

# Path
export PATH=~/bin:~/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/octave/3.8.0/bin:$PATH
#export PATH=~/.cabal/bin:/Users/seanhess/Library/Haskell/bin:$PATH
#Add GHC 7.8.3 to the PATH, via http://ghcformacosx.github.io/
# export GHC_DOT_APP="/Applications/ghc-7.10.1.app"
# if [ -d "$GHC_DOT_APP" ]; then
#     export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
# fi
# export PATH=/Users/seanhess/.stack/programs/x86_64-osx/ghc-7.10.2/bin:$PATH
# export PATH=/Users/seanhess/.stack/programs/x86_64-osx/ghc-7.10.2/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.stack/programs/x86_64-osx/ghc-8.0.1/bin:$PATH

# Tab Names
export PROMPT_COMMAND='echo -ne "\033]0;$(basename $PWD)\007"'

export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
export SCALA_HOME="/Users/seanhess/local"

#export EDITOR=vi crontab -e
export ELM_HOME="/usr/local/lib/node_modules/elm/share"

source ~/bin/git-completion.bash
alias gs='git status'
alias gc='git commit -m '
alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias postgres='/usr/local/bin/postgres -D /usr/local/var/postgres'
alias woot="stack exec --no-ghc-package-path hdevtools --"
#alias inkscape="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"

source ~/bin/services.sh
source ~/bin/servers.sh
source ~/bin/commands.sh
source ~/bin/tunnels.sh
source ~/.bash_private
# source ~/bin/z.sh

# source ~/.nvm/nvm.sh


#alias mocha="node_modules/.bin/mocha -R spec --compilers coffee:coffee-script"

#export PS1="\W $ "
export PS1="\[\e[1;32m\]\W \$\[\e[0m\] "
#export PS1="> "

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH


# eval "$(grunt --completion=bash)"

# enable ls **/*.text
# shopt -s globstar
# eval "$( HALCYON_NO_SELF_UPDATE=1 "/app/halcyon/halcyon" paths )"

export NODE_REPL_HISTORY_FILE=/Users/seanhess/.node_history

# added by Miniconda2 3.19.0 installer
export PATH="/Users/seanhess/miniconda2/bin:$PATH"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Android
export ANDROID_HOME=/usr/local/opt/android-sdk

export HISTSIZE=
export HISTFILESIZE=

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
