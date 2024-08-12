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

wk.add({
  { "<C-s>", "<CMD>w<CR>",                                                                      desc = "Save Buffer" },
  {
    "<C-S-h>",
    function()
      replicate5(tmux.resize_left)
    end,
    desc = "Resize Left",
  },
  {
    "<C-S-j>",
    function()
      replicate5(tmux.resize_bottom)
    end,
    desc = "Resize Bottom",
  },
  {
    "<C-S-k>",
    function()
      replicate5(tmux.resize_top)
    end,
    desc = "Resize Top",
  },
  {
    "<C-S-l>",
    function()
      replicate5(tmux.resize_right)
    end,
    desc = "Resize Right",
  },
  { "<C-q>", "<ESC><C-w>q",                                                                     desc = "Quit Window" },
  { "gd",    function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition" },
})

-- Window Commands
wk.add({
  mode = { "i", "n", "v", "t" },
  group = "window",
  {
    { "<C-w>q" },
    { "<C-w>/",    "<ESC><C-w>v",   desc = "Split Vertical" },
    { "<C-w>-",    "<ESC><C-w>s",   desc = "Split Horizontal" },
    { "<C-w>w",    "<ESC><C-w>q",   desc = "Quit Window" },
    { "<C-w><BS>", "<ESC><C-w>q",   desc = "Quit Window" },
    { "<C-w><CR>", ":tabnew %<CR>", desc = "Zoom Window" },
  }
})


-- Leader Prefix
wk.add({
  { "<leader>ce", ht.lsp.buf_eval_all, desc = "Eval All CodeLenses" },
  { "<leader>q",  "<CMD>bd<CR>",       desc = "Quit Buffer" },
  { "<leader>hr", ht.lsp.restart,      desc = "HLS Restart" },
  -- ["<leader>hs"] = { ":Telescope hoogle<CR>", "Hoogle Search" },
  {
    "<leader>hs",
    function()
      require("telescope").extensions.hoogle.hoogle()
    end,
    desc = "Hoogle Search",
  },
  {
    "<leader>dd",
    telescope.diagnostics,
    desc =
    "All Diagnostics"
  },
  {
    "<leader>de",
    function()
      telescope.diagnostics({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
    end,
    desc = "Errors"
  },
  {
    "<leader>dw",
    function()
      telescope.diagnostics({ severity = vim.lsp.protocol.DiagnosticSeverity.Warning })
    end,
    desc = "Warnings"
  },
  { "<leader><space>", ts.find_files,                        desc = "Find Files" },
  { "<leader>mp",      "<CMD>MarkdownPreview<CR>",           desc = "Markdown Preview" },
  { "<leader>bb",      require("telescope.builtin").buffers, desc = "All Buffers" },

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



})


wk.add({
  mode = { "n" },
  {
    {
      "]e",
      function()
        vim.diagnostic.goto_next({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
      end,
      desc = "Error Next"
    },
    {
      "[e",
      function()
        vim.diagnostic.goto_prev({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
      end,
      desc = "Error Prev"
    },
    { "]d", vim.diagnostic.goto_next, desc = "Diagnostic Next" },
    { "[d", vim.diagnostic.goto_prev, desc = "Diagnostic Prev" },
  }
})
