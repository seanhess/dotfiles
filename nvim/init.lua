require("options")
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
require("autocmds")

-- Set colorscheme
vim.cmd([[colorscheme onedark]])
