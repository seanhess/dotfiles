return {

  active = [[colorscheme cyberdream]],

  -- Configure LazyVim to load colorscheme
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     -- colorscheme = "tokyonight",
  --     colorscheme = "onedark",
  --     -- colorscheme = "catppuccin",
  --   },
  -- },
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  --
  -- { "EdenEast/nightfox.nvim" },

  {
    -- https://github.com/scottmckendry/cyberdream.nvim
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "dark",
      italic_comments = true,
      -- borderless_pickers = true,
      -- https://github.com/scottmckendry/cyberdream.nvim/blob/main/lua/cyberdream/colors.lua
      colors = {
        blue = "#82B6FF",
        cyan = "#82B6FF",
        green = "#49cc55",
      }
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    commit = "fa42eb5e26819ef58884257d5ae95dd0552b9a66",
    -- latte, frappe, macchiato, mocha

    opts = {
      flavour = "latte",
      -- flavour = "macchiato",
      -- flavour = "frappe",
      -- flavour = "mocha"
    },
  },

  {
    "navarasu/onedark.nvim",
    opts = {
      -- style = "cool",
      -- style = "dark",
      -- style = "deep",
      style = "darker",
      -- style = "light",

      highlights = {
        ["Visual"] = { bg = "#474B5E" },
        ["@comment"] = { fg = "#666666" },
        -- ["CurSearch"] = { bg = '$green' },
        ["Search"] = { bg = "#4E4E4E", fg = "clear" },
      },
    },
  },

}

-- -- Set colorscheme
-- vim.cmd([[colorscheme onedark]])
-- -- vim.cmd([[colorscheme catppuccin]])
