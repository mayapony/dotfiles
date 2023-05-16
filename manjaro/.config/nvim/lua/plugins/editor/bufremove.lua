return {
  {
    "echasnovski/mini.bufremove",
    enabled = false,
    -- stylua: ignore
    keys = {
      { "<leader>qq", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
    },
  },
  {
    'ojroques/nvim-bufdel',
    keys = {
      { "<leader>qq", "<cmd>BufDel<cr>",       desc = "Delete Buffer" },
      { "<leader>qo", "<cmd>BufDelOthers<cr>", desc = "Delete other buffer" },
    },
    config = function()
      require('bufdel').setup {
        next = 'tabs',
        quit = false, -- quit Neovim when last buffer is closed
      }
    end

  }
}
