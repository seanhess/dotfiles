return {
  {

    "stevearc/conform.nvim", -- https://github.com/stevearc/conform.nvim

    opts = {
      formatters_by_ft = {
        python = { "isort", "black" }
      },
      format_on_save = {
        -- fall back to lsp formatting
        lsp_format = "fallback",
        timeout_ms = 500,
      }
    }
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",

    config = function(_, opts)
      vim.lsp.enable('lua_ls') -- lua
      vim.lsp.enable('ts_ls')  -- typescript

      -- Python
      -- vim.lsp.enable('jedi_language_server') -- codebase navigation (goto definition), refactoring, authocomplete
      vim.lsp.enable('ruff')         -- linting
      vim.lsp.enable('basedpyright') -- errors
    end
  }
}
