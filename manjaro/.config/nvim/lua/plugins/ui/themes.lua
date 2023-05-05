return {
  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim"
    },
    config = function()
      require("vitesse").setup {
        comment_italics = true,
        transparnet_background = true,
        transparent_float_background = true, -- aka pum(popup menu) background
        reverse_visual = false,
        dim_nc = false,
        cmp_cmdline_disable_search_highlight_group = false, -- disable search highlight group for cmp item
      }
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        term_colors = true,
        transparent_background = false,
        no_italic = true,
        no_bold = false,
        styles = {
          comments = {},
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
        },
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
        highlight_overrides = {
          mocha = function(C)
            return {
              TabLineSel = { bg = C.pink },
              CmpBorder = { fg = C.surface2 },
              Pmenu = { bg = C.none },
              TelescopeBorder = { link = "FloatBorder" },
            }
          end,
        },
      }
      vim.cmd [[colorscheme catppuccin]]
    end
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "dawn",
    },
  },
  {
    'sainnhe/gruvbox-material'
  },
  { "EdenEast/nightfox.nvim" },
}
