SETUP
======

Install [FireCode Nerd Font Mono](https://www.nerdfonts.com/font-downloads)
* Download
* Drag into font book

[Install PyENV](https://realpython.com/intro-to-pyenv/).

    brew install pyenv
    brew install pyenv-virtualenv
    pyenv versions
    pyenv install 3.11.4
    pyenv local 3.11.4

    pyenv virtualenv 3.11.4 myproject
    pyenv local myproject

Watch Files

    watchexec -r -e py -- mypy .


TO INVESTIGATE
==============

- [ ] Treesitter



TEMP SETUP STEPS
================


    brew install pyenv
    brew install pyenv-virtualenv

    https://github.com/luc-tielen/telescope_hoogle

    cabal install hoogle
    hoogle generate


WATCHING FILES
==============

Watch all local python files, including sub directories and newly added files, and rerun command 

    watchexec -e py,txt mypy .
    -r # restart whatever it is



    





TMUX
==================

    https://tmuxcheatsheet.com/

Load all bound key commandso

    ctrl+a ?


Attaching to Sessions

    tmux
    tmux a
    tmux a -t 0
    tmux a -t named-session

Managing Sessions
  
    ctrl+b $
    ctrl+b d



Managing Panes

    # change layout (columns)
    ctrl+b space

    # show pane numbers
    ctrl+b q



Bring up the command prompt, then there are several commands

    ctrl+b :

Then there are lots of commands you can run

    rename-session my-name
    source-file ~/.tmux-conf


LAZY VIM MAPPINGS
==================

./ref/lazygit-keymaps.mht





    Neat Background Color = 31	32	47
    0x1F 0x20 0x2F



VIM SETUP
============


Known dependencies

    brew install ripgrep


Diagnostics

    :checkhealth Telescope


VIM COMMANDS
============


File Navigation

    _ff   Open File
    _/    Grep files

Mini Files - Open the editor, then edit it as a buffer

    _fm   Open
    l     Open in current window
    q     Quit
    =     Commit

Execute Files

    gx    Open file under cursor
    gf    Edit file under cursor


Comments

    gcc   Comment line
    gc    Comment (selection)

LSP

    ]d    Next Diagnostic
    ]e    Next Error
    ]w    Next Warning

Buffers

    _bd   Close buffer
    _bb   Switch to other buffer
    ]b    Next Buffer
