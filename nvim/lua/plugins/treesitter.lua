return {
  -- INSTALLATION - Install tree-sitter to CLI
  -- brew install tree-sitter
  -- brew install tree-sitter-cli
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- Explicitly stick to the modern rewrite branch
    build = ":TSUpdate",
    lazy = false,    -- The main branch does not support lazy-loading
    config = function()
      -- 1. Initialize with default paths (no complex options table needed)
      require('nvim-treesitter').setup()

      -- 2. Declaratively list and install your desired language parsers
      require('nvim-treesitter').install({
        "bash",
        "c",
        "html",
        "haskell",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml"
      })

      -- 3. Globally activate native Neovim syntax highlighting via core API
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype) or vim.bo[args.buf].filetype
          pcall(vim.treesitter.start, args.buf, lang)
        end,
      })
    end,
  },
}
