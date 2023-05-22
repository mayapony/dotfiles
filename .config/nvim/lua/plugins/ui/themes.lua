return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require("rose-pine").setup({
        disable_italics = true,
        disable_float_background = true,
      })

      vim.api.nvim_command("colorscheme rose-pine")
    end
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "dawn",
    },
  },
  { "EdenEast/nightfox.nvim" },
}
