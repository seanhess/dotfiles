return {

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
  { "folke/tokyonight.nvim", opts = { style = "moon" } },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    -- latte, frappe, macchiato, mocha
    opts = {
      flavour = "latte",
      -- flavour = "frappe",
      -- flavour = "macchiato",
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
      },
    },
  },
}
