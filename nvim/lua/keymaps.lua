local wk = require("which-key")
-- local Util = require("lazyvim.util")
local ht = require("haskell-tools")
local ts = require("telescope.builtin")
local tmux = require("tmux")
-- local harpoon = require("harpoon.ui")
local telescope = require("telescope.builtin")
-- require("telescope").load_extension('harpoon')

-- vim.api.nvim_set_keymap("n", "Q", "<Nop>", { noremap = true, silent = true })

-- vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- vim.keymap.del({ "n", "t" }, "<C-h>")
-- vim.keymap.del({ "n", "t" }, "<C-j>")
-- vim.keymap.del({ "n", "t" }, "<C-k>")
-- vim.keymap.del({ "n", "t" }, "<C-l>")

function replicate5(func)
  func()
  func()
  func()
  func()
  func()
end

-- wk.register({
--   ["-"] = { "<CMD>Oil<CR>" },
-- }, { mode = { "n", "v", "t" } })

wk.register({
  ["<C-s>"] = { "<CMD>w<CR>", "Save Buffer" },

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

  ["gd"] = { function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, "Goto Definition" },
})

-- Window Commands
wk.register({
  ["q"] = {},
  ["/"] = { "<ESC><C-w>v", "Split Vertical" },
  ["-"] = { "<ESC><C-w>s", "Split Horizontal" },
  ["w"] = { "<ESC><C-w>q", "Quit Window" },
  ["<BS>"] = { "<ESC><C-w>q", "Quit Window" },
  ["<CR>"] = { ":tabnew %<CR>", "Zoom Window" },
}, { prefix = "<C-w>", mode = { "i", "n", "v", "t" } })

-- Leader Prefix
wk.register({
  ["ce"] = { ht.lsp.buf_eval_all, "Eval All CodeLenses" },

  ["q"] = { "<CMD>bd<CR>", "Quit Buffer" },

  ["hr"] = { ht.lsp.restart, "HLS Restart" },
  -- ["<leader>hs"] = { ":Telescope hoogle<CR>", "Hoogle Search" },
  ["hs"] = {
    function()
      require("telescope").extensions.hoogle.hoogle()
    end,
    "Hoogle Search",
  },

  ["dd"] = { telescope.diagnostics, "All Diagnostics" },
  ["de"] = { function() telescope.diagnostics({ severity = vim.lsp.protocol.DiagnosticSeverity.Error }) end, "Errors" },
  ["dw"] = { function() telescope.diagnostics({ severity = vim.lsp.protocol.DiagnosticSeverity.Warning }) end, "Warnings" },

  ["<space>"] = { ts.find_files, "Find Files" },

  ["mp"] = { "<CMD>MarkdownPreview<CR>", "Markdown Preview" },

  ["bb"] = { require("telescope.builtin").buffers, "All Buffers" },

  -- ["hh"] = { harpoon.toggle_quick_menu, "Harpoon" },
  -- ["ha"] = { require("harpoon.mark").add_file, "Harpoon Add File" },
  -- [","] = { "<CMD>Telescope harpoon marks<CR>", "Harpoon" },
  -- ["hn"] = { harpoon.nav_next, "Harpoon Next" },
  -- ["hp"] = { harpoon.nav_prev, "Harpoon Prev" },
  -- ["hp"] = { harpoon.nav_prev, "Harpoon Back" },
  -- ["hl"] = { harpoon.toggle_quick_menu, "Harpoon" },
  -- ["hh"] = { harpoon.toggle_quick_menu, "Harpoon Next" },
  --
  -- ["ww"] = { require('kiwi').open_wiki_index, "Open Wiki Index" },
  -- ["wt"] = { require('kiwi').todo.toggle, "Toggle Markdown Task" }



}, { prefix = "<leader>" })


wk.register({
  ["]e"] = { function() vim.diagnostic.goto_next({ severity = vim.lsp.protocol.DiagnosticSeverity.Error }) end,
    "Error Next" },
  ["[e"] = { function() vim.diagnostic.goto_prev({ severity = vim.lsp.protocol.DiagnosticSeverity.Error }) end,
    "Error Prev" },

  ["]d"] = { vim.diagnostic.goto_next, "Diagnostic Next" },
  ["[d"] = { vim.diagnostic.goto_prev, "Diagnostic Prev" },
}, { mode = { "n" } })
