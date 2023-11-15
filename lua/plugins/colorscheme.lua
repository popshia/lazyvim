return {
  -- add gruvbox-material
  { "sainnhe/gruvbox-material" },

  -- disable default colorschemes
  { "folke/tokyonight.nvim",   enabled = false },
  { "catpuccin/nvim",          enabled = false },

  -- Configure LazyVim to load gruvbox-material
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
