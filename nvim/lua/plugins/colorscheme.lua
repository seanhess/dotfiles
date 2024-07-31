return {

  -- active = [[colorscheme onedark]],
  active = [[colorscheme catppuccin]],

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

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    -- latte, frappe, macchiato, mocha
    opts = {
      -- flavour = "latte",
      flavour = "macchiato",

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
