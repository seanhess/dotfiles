function replicate5(func)
  func()
  func()
  func()
  func()
  func()
end

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {},
  config = function(opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Nested mappings don't work in the maps list above!
    wk.add({

      { "//",         "<CMD>noh<CR>",                            desc = "Clear Search Highlight" },
      { "<C-s>",      "<CMD>w<CR>",                              desc = "Save Buffer" },
      { "<leader>ce", require("haskell-tools").lsp.buf_eval_all, desc = "Eval All CodeLenses" },
      { "<leader>q",  "<CMD>bd<CR>",                             desc = "Quit Buffer" },
      { "<leader>hr", require("haskell-tools").lsp.restart,      desc = "HLS Restart" },
      {
        group = "LSP",
        -- {
        --   "<leader>hs",
        --   function()
        --     require("telescope").extensions.hoogle.hoogle()
        --   end,
        --   desc = "Hoogle Search",
        -- },
        {
          "<leader>lr",
          desc = "LSP Restart",
          vim.lsp.restart
        },

      },
      {
        group = "Telescope",
        {
          "<leader>td",
          desc = "Diagnostics",
          require("telescope.builtin").diagnostics,
        },
        {
          "<leader>te",
          desc = "Erors",
          function()
            require("telescope.builtin").diagnostics({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
          end,
        },
        {
          "<leader>tw",
          desc = "Warnings",
          function()
            require("telescope.builtin").diagnostics({ severity = vim.lsp.protocol.DiagnosticSeverity.Warning })
          end,
        },
        {
          "<leader>tt",
          ":TodoTelescope<CR>",
          desc = "TODOs",
        },
      },
      { "<leader><space>", require("telescope.builtin").find_files, desc = "Find Files" },
      { "<leader>bb",      require("telescope.builtin").buffers,    desc = "All Buffers" },
      { "<leader>mp",      "<CMD>MarkdownPreview<CR>",              desc = "Markdown Preview" },

      {
        mode = { "i" },
        { "<C-p>", "<C-r>", desc = "Paste Register" }
      },
      {
        mode = { "n", "v" }, -- NORMAL and VISUAL mode
        {
          "]e",
          desc = "Error Next",
          function()
            vim.diagnostic.goto_next({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
          end
        },
        {
          "[e",
          desc = "Error Prev",
          function()
            vim.diagnostic.goto_prev({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
          end
        },
        { "]d", desc = "Diagnostic Next", vim.diagnostic.goto_next },
        { "[d", desc = "Diagnostic Prev", vim.diagnostic.goto_prev },

        {
          "gd",
          desc = "Goto Definition",
          function()
            require("telescope.builtin").lsp_definitions({ reuse_win = true })
          end,
        },
      },
      {
        mode = { "i", "n", "v", "t" },
        group = "windows",

        { "<C-w>q" },
        { "<C-w>/",    "<ESC><C-w>v",   desc = "Split Vertical" },
        { "<C-w>-",    "<ESC><C-w>s",   desc = "Split Horizontal" },
        { "<C-w>w",    "<ESC><C-w>q",   desc = "Quit Window" },
        { "<C-w><BS>", "<ESC><C-w>q",   desc = "Quit Window" },
        { "<C-w><CR>", ":tabnew %<CR>", desc = "Zoom Window" },
        {
          "<C-S-h>",
          desc = "Resize Left",
          function()
            replicate5(require("tmux").resize_left)
          end,
        },
        {
          "<C-S-j>",
          desc = "Resize Bottom",
          function()
            replicate5(require("tmux").resize_bottom)
          end,
        },
        {
          "<C-S-k>",
          desc = "Resize Top",
          function()
            replicate5(require("tmux").resize_top)
          end,
        },
        {
          "<C-S-l>",
          desc = "Resize Right",
          function()
            replicate5(require("tmux").resize_right)
          end,
        },
        { "<C-q>", "<ESC><C-w>q", desc = "Quit Window" },
      }
    })
  end
}
