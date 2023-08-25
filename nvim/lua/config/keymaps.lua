local wk = require("which-key")
local ht = require("haskell-tools")
local ts = require("telescope.builtin")
local tmux = require("tmux")

vim.api.nvim_set_keymap("n", "Q", "<Nop>", { noremap = true, silent = true })

vim.keymap.del({ "n", "t" }, "<C-h>")
vim.keymap.del({ "n", "t" }, "<C-j>")
vim.keymap.del({ "n", "t" }, "<C-k>")
vim.keymap.del({ "n", "t" }, "<C-l>")

function replicate5(func)
  func()
  func()
  func()
  func()
  func()
end

wk.register({
  ["<C-h>"] = { tmux.move_left, "Navigate Left" },
  ["<C-j>"] = { tmux.move_down, "Navigate Down" },
  ["<C-k>"] = { tmux.move_up, "Navigate Up" },
  ["<C-l>"] = { tmux.move_right, "Navigate Right" },

  ["<C-S-h>"] = {
    function()
      replicate5(tmux.resize_left)
    end,
    "Resize Left",
  },
  ["<C-S-j>"] = {
    function()
      replicate5(tmux.resize_bottom)
    end,
    "Resize Bottom",
  },
  ["<C-S-k>"] = {
    function()
      replicate5(tmux.resize_top)
    end,
    "Resize Top",
  },
  ["<C-S-l>"] = {
    function()
      replicate5(tmux.resize_right)
    end,
    "Resize Right",
  },

  ["<C-q>"] = { "<ESC><C-w>q", "Quit Window" },
})

wk.register({
  ["ce"] = { ht.lsp.buf_eval_all, "Eval All CodeLenses" },

  ["hr"] = { ht.lsp.restart, "HLS Restart" },
  -- ["<leader>hs"] = { ":Telescope hoogle<CR>", "Hoogle Search" },
  ["hs"] = {
    function()
      require("telescope").extensions.hoogle.hoogle()
    end,
    "Hoogle Search",
  },

  ["en"] = {
    function()
      vim.diagnostic.goto_next({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
    end,
    "Error Next",
  },
  ["e?"] = {
    function()
      vim.diagnostic.goto_prev({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
    end,
    "Error Next",
  },

  ["<space>"] = { ts.find_files, "Find Files" },
}, { prefix = "<leader>" })

wk.register({
  ["q"] = {},
  ["/"] = { "<ESC><C-w>v", "Split Vertical" },
  ["-"] = { "<ESC><C-w>s", "Split Horizontal" },
  ["w"] = { "<ESC><C-w>q", "Quit Window" },
  ["<BS>"] = { "<ESC><C-w>q", "Quit Window" },
  ["<CR>"] = { ":tabnew %<CR>", "Zoom Window" },
}, { prefix = "<C-w>", mode = { "i", "n", "v", "t" } })

-- vim.keymap.set("n", "<leader>ce", vim.lsp.codelens.run, { noremap = true })

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
--Disable Ex mode

-- vim.api.nvim_set_keymap("n", "<leader>w\\", ":vsplit<CR>", { noremap = true, silent = true })
-- vim.api.nvim_del_keymap("n", "<leader>w|")
--
-- vim.keymap.del({ "n", "v" }, "s")
--
--
--
-- vim.api.nvim_set_keymap("n", "<leader>cx", "<Cmd>lua vim.lsp.codelens.run()<CR>", {})
