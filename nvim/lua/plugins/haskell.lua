return {

  { "luc-tielen/telescope_hoogle" },

  {
    "mrcjkb/haskell-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "luc-tielen/telescope_hoogle" },
    branch = "1.x.x",
    config = function(_, opts)
      require("haskell-tools").setup(opts)
      local hoogle_local = require("haskell-tools.hoogle.local")
      print(hoogle_local)
    end,
    opts = {
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
    },
  },
}
