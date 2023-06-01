return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function ()
      require("catppuccin").setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        background = { -- :h background
            light = "latte",
            dark = "frappe",
        },
        no_italic = true, -- Force no italic
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            notify = false,
            mini = false,
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })
      vim.api.nvim_command("colorscheme catppuccin")
    end
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require("rose-pine").setup({
        disable_italics = true,
        disable_float_background = true,
      })

      -- vim.api.nvim_command("colorscheme rose-pine")
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
