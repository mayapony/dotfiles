local builtin = require("telescope.builtin")
local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  keys = {
    { "<leader>,",       "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
    { "<leader>/",       builtin.live_grep,                                  desc = "Find in Files (Grep)" },
    { "<leader>:",       "<cmd>Telescope command_history<cr>",               desc = "Command History" },
    { "<leader><space>", builtin.find_files,                                 desc = "Find Files (root dir)" },
    -- find
    { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",                      desc = "Recent" },
    { "<leader>fp",      "<cmd>Telescope projects<cr>",                      desc = "Change Projects" },
    { "<leader>fN",      "<cmd>Telescope notify<cr>",                        desc = "Notify" },
    -- search
    { "<leader>sa",      "<cmd>Telescope autocommands<cr>",                  desc = "Auto Commands" },
    { "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>",     desc = "Buffer" },
    { "<leader>sC",      "<cmd>Telescope commands<cr>",                      desc = "Commands" },
    { "<leader>sd",      "<cmd>Telescope diagnostics<cr>",                   desc = "Diagnostics" },
    { "<leader>sh",      "<cmd>Telescope help_tags<cr>",                     desc = "Help Pages" },
    { "<leader>sH",      "<cmd>Telescope highlights<cr>",                    desc = "Search Highlight Groups" },
    { "<leader>sk",      "<cmd>Telescope keymaps<cr>",                       desc = "Key Maps" },
    { "<leader>sM",      "<cmd>Telescope man_pages<cr>",                     desc = "Man Pages" },
    { "<leader>sm",      "<cmd>Telescope marks<cr>",                         desc = "Jump to Mark" },
    { "<leader>so",      "<cmd>Telescope vim_options<cr>",                   desc = "Options" },
    { "<leader>sR",      "<cmd>Telescope resume<cr>",                        desc = "Resume" },
    { "<leader>sw",      builtin.grep_string,                                desc = "Word (root dir)" },
    {
      "<leader>sW",
      builtin.grep_string,
      { cwd = false },
      desc =
      "Word (cwd)"
    },
    { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
  init = function()
    require("telescope").load_extension("projects")
    require("telescope").load_extension("notify")
  end,
}
