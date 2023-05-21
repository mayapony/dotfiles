return {
  -- amongst your other plugins
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-t>]],
      })
    end,
    keys = {
      { "<leader>ut", "<cmd>ToggleTerm<CR>", desc = "Toggle Term" },
    },
  },
}
