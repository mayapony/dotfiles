return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  lazy = false,
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
      end,
      desc = "Explorer NeoTree (root dir)",
    }
  },
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree")
      end
    end
  end,
  opts = {
    close_if_last_window = true,
    filesystem = {
      follow_current_file = true,
    },
    window = {
      mappings = {
        ["<space>"] = "none",
      },
      width = 25
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = false,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added     = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified  = "*", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted   = "✖", -- this can only be used in the git_status source
          renamed   = "",  -- this can only be used in the git_status source
          -- Status type
          untracked = "?",
          ignored   = "-",
          unstaged  = "",
          staged    = "",
          conflict  = "",
        }
      },
    },
  },
}
