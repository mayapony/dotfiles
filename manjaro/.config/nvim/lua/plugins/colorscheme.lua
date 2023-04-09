return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      no_italic = true,
      transparent_background = true,
    })
    vim.cmd([[colorscheme catppuccin]])
  end,
}
--
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   name = "tokyonight",
--   config = function()
--     require("tokyonight").setup({
--       transparent = true,
--     })
--     vim.cmd([[colorscheme tokyonight]])
--   end,
-- }
