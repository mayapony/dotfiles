return {
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   enabled = false,
  --   config = function()
  --     require("catppuccin").setup({
  --       -- transparent_background = true,
  --       no_italic = true
  --     })
  --   end
  -- },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        disable_italics = true,
        bold_vert_split = true,
        -- disable_background = true,
        -- disable_float_background = false,
      })
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "dawn",
    },
  }
  -- {
  --   'uloco/bluloco.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   dependencies = { 'rktjmp/lush.nvim' },
  --   config = function()
  --     -- your optional config goes here, see below.
  --     vim.cmd([[colorscheme bluloco]])
  --   end,
  -- },
}
