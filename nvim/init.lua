vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

vim.o.number = true

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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})

require("keymaps")

-- Set colorscheme
vim.cmd([[colorscheme onedark]])
