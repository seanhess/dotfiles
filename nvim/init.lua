-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- disable swap file
vim.opt.swapfile = false
-- disable backup
vim.opt.backup = false
-- disable creating a backup before overwriting a file
vim.opt.writebackup = false

-- reload files when edited externally
vim.opt.autoread = true
vim.cmd([[autocmd FocusGained * :checktime]])

-- disable ex mode
vim.api.nvim_set_keymap("n", "Q", "<Nop>", { noremap = true, silent = true })
