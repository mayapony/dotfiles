-- return {
--   "catppuccin/nvim",
--   lazy = false,
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup({
--       flavour = "mocha", -- latte, frappe, macchiato, mocha
--       background = {
--         light = "latte",
--         dark = "frappe",
--       },
--       no_italic = true,
--       transparent_background = true,
--       term_colors = true,
--       navic = {
--         enabled = false,
--         custom_bg = "NONE",
--       },
--       native_lsp = {
--         enabled = true,
--         virtual_text = {
--           errors = { "italic" },
--           hints = { "italic" },
--           warnings = { "italic" },
--           information = { "italic" },
--         },
--         underlines = {
--           errors = { "underline" },
--           hints = { "underline" },
--           warnings = { "underline" },
--           information = { "underline" },
--         },
--       },
--       color_overrides = {},
--       -- custom_highlights = function(colors)
--       --   return {
--       --     NeoTreeCursorLine = { bg = colors.crust },
--       --   }
--       -- end,
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         telescope = true,
--         notify = true,
--         mini = true,
--         fidget = true,
--         leap = true,
--         neotree = true,
--         noice = true,
--         navic = true,
--         treesitter = true,
--         treesitter_context = true,
--         symbols_outline = true,
--         lsp_trouble = true,
--         which_key = true,
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--       },
--     })
--     vim.cmd([[colorscheme catppuccin]])
--   end,
-- }
--
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   name = "tokyonight",
--   config = function()
--     require("tokyonight").setup({
--       style = "storm",
--       transparent = false,
--       styles = {
--         -- Style to be applied to different syntax groups
--         -- Value is any valid attr-list value for `:help nvim_set_hl`
--         comments = { italic = false },
--         keywords = { italic = false },
--         -- Background styles. Can be "dark", "transparent" or "normal"
--         sidebars = "normal",
--         floats = "normal",
--       },
--       sidebars = { "qf", "help" },
--       lualine_bold = true,
--     })
--     vim.cmd([[colorscheme tokyonight]])
--   end,
-- }
--
return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  name = "everforest",
  config = function()
    vim.cmd([[
        " For light version.
        " set background=light

        " Set contrast.
        " This configuration option should be placed before `colorscheme everforest`.
        " Available values: 'hard', 'medium'(default), 'soft'
        " let g:everforest_background = 'soft'
        colorscheme everforest
      ]])
  end
}
