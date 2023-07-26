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

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count for

-- save on exit buffer
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  callback = function()
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
      vim.api.nvim_command("update")

    end
  end,
})
