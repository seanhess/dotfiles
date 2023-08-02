return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim" },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "cool",
      highlights = {
        ["Visual"] = { bg = "#474B5E" },
        -- ["Visual"] = { fg = "$green", bg = "#474B5E" },
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "onedark" },
  },
}
