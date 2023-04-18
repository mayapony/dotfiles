local builtin = require("telescope.builtin")
local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  keys = {
    { "<leader>,",       "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
    { "<leader>/",       builtin.live_grep,                                  desc = "Find in Files (Grep)" },
    { "<leader>:",       "<cmd>Telescope command_history<cr>",               desc = "Command History" },
    { "<leader><space>", builtin.find_files,                                 desc = "Find Files (root dir)" },
    -- find
    { "<leader>fb",      "<cmd>Telescope buffers<cr>",                       desc = "Buffers" },
    { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",                      desc = "Recent" },
    { "<leader>fp",      "<cmd>Telescope projects<cr>",                      desc = "Projects" },
    { "<leader>fN",      "<cmd>Telescope notify<cr>",                        desc = "Notify" },
    -- git
    { "<leader>gc",      "<cmd>Telescope git_commits<CR>",                   desc = "commits" },
    { "<leader>gs",      "<cmd>Telescope git_status<CR>",                    desc = "status" },
    -- search
    { "<leader>sa",      "<cmd>Telescope autocommands<cr>",                  desc = "Auto Commands" },
    { "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>",     desc = "Buffer" },
    { "<leader>sc",      "<cmd>Telescope command_history<cr>",               desc = "Command History" },
    { "<leader>sC",      "<cmd>Telescope commands<cr>",                      desc = "Commands" },
    { "<leader>sd",      "<cmd>Telescope diagnostics<cr>",                   desc = "Diagnostics" },
    { "<leader>sg",      builtin.live_grep,                                  desc = "Grep (root dir)" },
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
    -- {
    --   "<leader>ss",
    --   Util.telescope("lsp_document_symbols", {
    --     symbols = {
    --       "Class",
    --       "Function",
    --       "Method",
    --       "Constructor",
    --       "Interface",
    --       "Module",
    --       "Struct",
    --       "Trait",
    --       "Field",
    --       "Property",
    --     },
    --   }),
    --   desc = "Goto Symbol",
    -- },
    {
      "<leader>sS",
      Util.telescope("lsp_workspace_symbols", {
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      desc = "Goto Symbol (Workspace)",
    },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
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
