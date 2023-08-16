-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Move to window using the <ctrl> hjkl keys

-- https://github.com/aserowy/tmux.nvim/issues/92
-- local Util = require("lazyvim.util")
-- local function map(mode, lhs, rhs, opts)
--   local keys = require("lazy.core.handler").handlers.keys
--   ---@cast keys LazyKeysHandler
--   -- do not create the keymap if a lazy keys handler exists
--   if not keys.active[keys.parse({ lhs, mode = mode }).id] th-en
--     opts = opts or {}
--     opts.silent = opts.silent ~= false
--     vim.keymap.set(mode, lhs, rhs, opts)
--   end
-- end

-- map("n", "<C-h>", "<cmd>lua require'tmux'.move_left()<cr>", { desc = "Go to left window" })
-- map("n", "<C-j>", "<cmd>lua require'tmux'.move_bottom()<cr>", { desc = "Go to lower window" })
-- map("n", "<C-k>", "<cmd>lua require'tmux'.move_top()<cr>", { desc = "Go to upper window" })
-- map("n", "<C-l>", "<cmd>lua require'tmux'.move_right()<cr>", { desc = "Go to right window" })

-- vim.api.nvim_set_keymap("n", "<C-w>\\", ":vsplit<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-w>-", ":split<CR>", { noremap = true, silent = true })
--
vim.api.nvim_set_keymap("n", "<leader>w\\", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_del_keymap("n", "<leader>w|")
vim.api.nvim_set_keymap("n", "<leader>en", "]e", {})
vim.api.nvim_set_keymap("n", "<leader>e?", "[e", {})
-- vim.keymap.del({ "n", "v" }, "s")
