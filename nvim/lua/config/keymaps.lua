local wk = require("which-key")
local ht = require("haskell-tools")
local ts = require("telescope.builtin")

local opts = { noremap = true, silent = true }
local all = { "n", "i", "v" }
--
vim.keymap.set(all, "<C-h>", "<ESC><C-w>h", opts)
vim.keymap.set(all, "<C-j>", "<ESC><C-w>j", opts)
vim.keymap.set(all, "<C-k>", "<ESC><C-w>k", opts)
vim.keymap.set(all, "<C-l>", "<ESC><C-w>l", opts)

-- https://github.com/Vigemus/iron.nvim/issues/93
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

-- vim.keymap.set(all, "<leader>t", function()
--   print("real lua function")
--   vim.cmd("vsplit")
-- end, opts)
--
wk.register({
  ["<leader>ce"] = { ht.lsp.buf_eval_all, "Eval All CodeLenses" },

  ["<leader>hr"] = { ht.lsp.restart, "HLS Restart" },
  -- ["<leader>hs"] = { ":Telescope hoogle<CR>", "Hoogle Search" },
  ["<leader>hs"] = {
    function()
      require("telescope").extensions.hoogle.hoogle()
    end,
    "Hoogle Search",
  },

  ["<leader>en"] = {
    function()
      vim.diagnostic.goto_next({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
    end,
    "Error Next",
  },
  ["<leader>e?"] = {
    function()
      vim.diagnostic.goto_prev({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
    end,
    "Error Next",
  },

  ["<leader><space>"] = { ts.find_files, "Find Files" },
  -- Conflicts with which-key
  -- ["<C-w><BS>"] = { "<ESC><C-w>q", "Quit a Window" },
  --
})

wk.register({
  ["q"] = {},
  ["/"] = { "<ESC><C-w>v", "Split Vertical" },
  ["_"] = { "<ESC><C-w>s", "Split Horizontal" },
  ["w"] = { "<ESC><C-w>q", "Quit Window" },
  ["<CR>"] = { ":tabnew %<CR>", "Zoom Window" },
}, { prefix = "<C-w>", mode = { "i", "n", "v", "t" } })

-- vim.keymap.set("n", "<leader>ce", vim.lsp.codelens.run, { noremap = true })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move to window using the <ctrl> hjkl keys
-- vim.api.nvim_set_keymap("n", "<C-w>\\", ":vsplit<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-w>-", ":split<CR>", { noremap = true, silent = true })
--
--Disable Ex mode
vim.api.nvim_set_keymap("n", "Q", "<Nop>", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "<leader>w\\", ":vsplit<CR>", { noremap = true, silent = true })
-- vim.api.nvim_del_keymap("n", "<leader>w|")
--
-- vim.keymap.del({ "n", "v" }, "s")
--
--
--
-- vim.api.nvim_set_keymap("n", "<leader>cx", "<Cmd>lua vim.lsp.codelens.run()<CR>", {})
