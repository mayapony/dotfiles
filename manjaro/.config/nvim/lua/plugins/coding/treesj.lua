return {
  'Wansmer/treesj',
  keys = {
    { '<space>ct', "<cmd>TSJToggle<cr>", desc = "Toggle code" }
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
    })
  end,
}
