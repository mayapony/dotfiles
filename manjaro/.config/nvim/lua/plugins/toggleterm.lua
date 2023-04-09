return {
  -- amongst your other plugins
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-j>]],
        on_stdout = function(t, job, data, name)
          return true
        end,
      })
    end,
    keys = {
      { "<leader>ut", "<cmd>ToggleTerm<CR>", desc = "Toggle Term" },
    },
  },
}
