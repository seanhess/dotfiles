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
    on_attach = function(client, bufnr, ht)
      -- auto format
      require("lsp-format").on_attach(client, bufnr)
    end,
    --   print("ATTACH", ht.default_settings.haskell)
    -- end,
    default_settings = {
      haskell = { -- haskell-language-server options
        formattingProvider = "fourmolu",
        -- formattingProvider = "ormolu",
        -- Setting this to true could have a performance impact on large mono repos.
        checkProject = true,
        plugin = {
          hlint = {
            codeActionsOn = true,
            diagnosticsOn = true,
          },
          stan = {
            globalOn = false,
          }
        }, -- don't
      },
    },
  },
}

return {

  { "luc-tielen/telescope_hoogle" },

  {
    "mrcjkb/haskell-tools.nvim",
    version = '^4', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
}
