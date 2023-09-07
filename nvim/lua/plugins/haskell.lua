return {

  { "luc-tielen/telescope_hoogle" },

  {
    "mrcjkb/haskell-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "luc-tielen/telescope_hoogle" },
    branch = "2.x.x",
    config = function(_, opts)
      vim.g.haskell_tools = {
        codeLens = {
          -- Whether to automatically display/refresh codeLenses
          -- (explicitly set to false to disable)
          autoRefresh = true,
        },
        hoogle = {
          mode = "telescope-local",
        },
        hls = { -- LSP client options
          -- ...
          default_settings = {
            haskell = { -- haskell-language-server options
              formattingProvider = "fourmolu",
              -- formattingProvider = "none",
              -- Setting this to true could have a performance impact on large mono repos.
              checkProject = false,
            },
          },
        },
      }
    end,
  },
}
