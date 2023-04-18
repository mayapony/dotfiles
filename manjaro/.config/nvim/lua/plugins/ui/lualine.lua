return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  -- opts = function()
  --   local icons = require("lazyvim.config").icons
  --
  --   local function fg(name)
  --     return function()
  --       ---@type {foreground?:number}?
  --       local hl = vim.api.nvim_get_hl_by_name(name, true)
  --       return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
  --     end
  --   end
  --
  --   return {
  --     options = {
  --       theme = "auto",
  --       globalstatus = true,
  --       disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
  --       component_separators = { left = "", right = "" },
  --     },
  --     sections = {
  --       lualine_a = { "mode" },
  --       lualine_b = { "branch" },
  --       lualine_c = {
  --         {
  --           "diagnostics",
  --           symbols = {
  --             error = icons.diagnostics.Error,
  --             warn = icons.diagnostics.Warn,
  --             info = icons.diagnostics.Info,
  --             hint = icons.diagnostics.Hint,
  --           },
  --         },
  --         {
  --           "filetype",
  --           icon_only = true,
  --           separator = "",
  --           padding = {
  --             left = 1,
  --             right = 0
  --           }
  --         },
  --         { "filename", path = 1, symbols = { modified = "*", readonly = "", unnamed = "" } },
  --         -- stylua: ignore
  --         -- {
  --         --   function() return require("nvim-navic").get_location() end,
  --         --   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
  --         -- },
  --       },
  --       lualine_x = {
  --         -- stylua: ignore
  --         {
  --           function() return require("noice").api.status.command.get() end,
  --           cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
  --           color = fg("Statement")
  --         },
  --         -- stylua: ignore
  --         {
  --           function() return require("noice").api.status.mode.get() end,
  --           cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
  --           color = fg("Constant"),
  --         },
  --         -- { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
  --         {
  --           "diff",
  --           symbols = {
  --             added = icons.git.added,
  --             modified = icons.git.modified,
  --             removed = icons.git.removed,
  --           },
  --         },
  --       },
  --       lualine_y = {
  --         { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
  --         { "location", padding = { left = 0, right = 1 } },
  --       },
  --       lualine_z = {
  --         function()
  --           return " " .. os.date("%R")
  --         end,
  --       },
  --     },
  --     extensions = { "neo-tree", "toggleterm" },
  --   }
  -- end,
  config = function()
    -- Eviline config for lualine
    -- Author: shadmansaleh
    -- Credit: glepnir
    local lualine = require('lualine')

    local colors = require("catppuccin.palettes").get_palette()

    local icons = require("lazyvim.config").icons

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = { left = "", right = "" },
        section_separators = '',
        theme = {
          normal = { c = { fg = colors.text, bg = colors.crust } },
          inactive = { c = { fg = colors.text, bg = colors.crust } },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      extensions = { "neo-tree", "toggleterm" },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left {
      function()
        return '▊'
      end,
      color = { fg = colors.blue },      -- Sets highlighting of component
      padding = { left = 0, right = 0 }, -- We don't need space before this
    }

    ins_left {
      "mode",
      color = function()
        local mode_color = {
          n = colors.red,
          i = colors.green,
          v = colors.blue,
          V = colors.blue,
          c = colors.mauve,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          [''] = colors.orange,
          ic = colors.yellow,
          R = colors.mauve,
          Rv = colors.mauve,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ['r?'] = colors.cyan,
          ['!'] = colors.red,
          t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
      end
    }

    -- ins_left {
    --   -- filesize component
    --   'filesize',
    --   cond = conditions.buffer_not_empty,
    -- }



    ins_left {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = {
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warn,
        info = icons.diagnostics.Info
      },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
      },
    }
    -- Add components to right sections
    -- ins_left {
    --   -- Lsp server name .
    --   function()
    --     local msg = 'No Active Lsp'
    --     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    --     local clients = vim.lsp.get_active_clients()
    --     if next(clients) == nil then
    --       return msg
    --     end
    --     for _, client in ipairs(clients) do
    --       local filetypes = client.config.filetypes
    --       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
    --         return client.name
    --       end
    --     end
    --     return msg
    --   end,
    --   icon = ' ',
    --   color = { fg = colors.mauve, gui = 'bold' },
    -- }

    ins_left { 'location' }
    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left {
      function()
        return '%='
      end,
    }

    ins_left {
      "filetype",
      icon_only = true,
      separator = "",
      padding = {
        left = 1,
        right = 0
      }
    }
    ins_left {
      'filename',
      cond = conditions.buffer_not_empty,
      color = { fg = colors.pink, gui = 'bold' },
      separator = {
        left = 0
      },
      symbols = {
        modified = "*",
        readonly = "",
        unnamed = ""
      }
    }

    ins_right {
      'diff',
      -- Is it me or the symbol for modified us really weird
      symbols = { added = ' ', modified = '柳', removed = ' ' },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    }
    --
    -- ins_right {
    --   'o:encoding',       -- option component same as &encoding in viml
    --   fmt = string.upper, -- I'm not sure why it's upper case either ;)
    --   cond = conditions.hide_in_width,
    --   color = { fg = colors.green, gui = 'bold' },
    -- }

    ins_right {
      'branch',
      icon = '',
      color = { fg = colors.violet, gui = 'bold' },
    }

    ins_right {
      function()
        return '▊'
      end,
      color = { fg = colors.blue },
      padding = { left = 1 },
    }

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end
}
