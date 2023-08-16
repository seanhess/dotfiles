-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- disable swap file
vim.o.swapfile = false
-- disable backup
vim.o.backup = false
-- disable creating a backup before overwriting a file
vim.o.writebackup = false

-- reload files when edited externally
vim.o.autoread = true
vim.cmd([[autocmd FocusGained * :checktime]])

-- disable ex mode
vim.api.nvim_set_keymap("n", "Q", "<Nop>", { noremap = true, silent = true })

vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 2 -- Size of an indent
vim.o.tabstop = 2 -- Number of spaces tabs count for
vim.o.exrc = true
vim.o.relativenumber = false

-- save on exit buffer
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  callback = function()
    local save = function()
      vim.api.nvim_command("update")
    end

    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
      pcall(save)
    end
  end,
})
