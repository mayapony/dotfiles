return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    { "<leader>ft", "<Cmd>BufferLinePick<CR>",                 desc = "Find Buffer" },
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      themable = true,
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explore",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
