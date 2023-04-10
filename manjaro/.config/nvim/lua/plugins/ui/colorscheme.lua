return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      no_italic = true,
      transparent_background = true,
      navic = {
        enabled = false,
        custom_bg = "NONE",
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      integrations = {
        cmp = true,
        gitsigns = false,
        telescope = true,
        notify = true,
        mini = true,
        fidget = true,
        leap = true,
        neotree = true,
        noice = true,
        navic = true,
        treesitter = true,
        treesitter_context = true,
        symbols_outline = true,
        lsp_trouble = true,
        which_key = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
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
