return {

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      colorscheme = "onedark",
    },
  },
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim", opts = { style = "moon" } },

  {
    "navarasu/onedark.nvim",
    opts = {
      -- style = "cool",
      -- style = "dark",
      style = "deep",
      -- style = "darker",
      highlights = {
        ["Visual"] = { bg = "#474B5E" },
        ["@comment"] = { fg = "#666666" },
      },
    },
  },
}
