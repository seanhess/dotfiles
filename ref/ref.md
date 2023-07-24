TO INVESTIGATE
==============

- [ ] Treesitter






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
