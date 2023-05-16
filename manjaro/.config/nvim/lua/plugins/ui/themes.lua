return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require("rose-pine").setup({
        disable_italics = true,
      })

      vim.api.nvim_command("colorscheme rose-pine-main")
    end
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "dawn",
    },
  },
  { "EdenEast/nightfox.nvim" },
  -- {
  --   "2nthony/vitesse.nvim",
  --   lazy = false,
  --   priority = 150,
  --   dependencies = {
  --     "tjdevries/colorbuddy.nvim"
  --   },
  --   config = function()
  --     require("vitesse").setup {
  --       comment_italics = false,
  --       transparnet_background = false,
  --       transparent_float_background = false, -- aka pum(popup menu) background
  --       reverse_visual = false,
  --       dim_nc = false,
  --       cmp_cmdline_disable_search_highlight_group = false, -- disable search highlight group for cmp item
  --     }
  --     vim.cmd [[colorscheme vitesse]]
  --   end
  -- },
}
