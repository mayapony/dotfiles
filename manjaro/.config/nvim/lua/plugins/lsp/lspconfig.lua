return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf",                                config = true },
    { "folke/neodev.nvim",  opts = { experimental = { pathStrict = true } } },
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "themaxmarchuk/tailwindcss-colors.nvim",
    "jose-elias-alvarez/typescript.nvim",
    {
      "hrsh7th/cmp-nvim-lsp",
      cond = function()
        return require("lazyvim.util").has("nvim-cmp")
      end,
    },
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
      },
      opts = { lsp = { auto_attach = true } },
      keys = {
        { "<leader>ss", "<cmd>Navbuddy<cr>", desc = "Toggle navbuddy" },
      }
    }
  },
  ---@class PluginLspOpts
  opts = {
    -- config ufo from https://github.com/LazyVim/LazyVim/issues/448
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
    -- options for vim.diagnostic.config()
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4, prefix = "●" },
      severity_sort = true,
    },
    -- Automatically format on save
    autoformat = true,
    -- options for vim.lsp.buf.format
    -- `bufnr` and `filter` is handled by the LazyVim formatter,
    -- but can be also overridden when specified
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
    -- LSP Server Settings
    ---@type lspconfig.options
    servers = {
      jsonls = {},
      eslint = {},
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      tsserver = {
        -- source https://stackoverflow.com/questions/49582984/how-do-i-disable-js-file-is-a-commonjs-module-it-may-be-converted-to-an-es6
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
        },
      },
    },
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      eslint = function()
        require("lazyvim.util").on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
      tailwindscss = function()
        local nvim_lsp = require("lspconfig")
        local on_attach = function(client, bufnr)
          -- other stuff --
          require("tailwindcss-colors").buf_attach(bufnr)
        end
        nvim_lsp["tailwindcss"].setup({
          on_attach = on_attach,
        })
      end,
      tsserver = function(_, opts)
        local typescript = require("typescript")
        typescript.setup({
          server = opts,
          disable_commands = false, -- prevent the plugin from creating Vim commands
          go_to_source_definition = {
            fallback = true,        -- fall back to standard LSP definition on failure
          },
          debug = false,            -- enable debug logging for commands
        })
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        keys[#keys + 1] = { "<leader>ca", "<cmd>CodeActionMenu<cr>", desc = "Code action menu" }
        -- TODO something error here
        -- require("lazyvim.util").on_attach(function(client, buffer)
        --   if client.name == "tsserver" then
        --     -- stylua: ignore
        --     vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>",
        --       { buffer = buffer, desc = "Organize Imports" })
        --     vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
        --     vim.keymap.set("n", "<leader>ci", "<cmd>TypescriptAddMissingImports<CR>",
        --       { desc = "Import missing modules", buffer = buffer })
        --     vim.keymap.set("n", "<leader>cc", "<cmd>TypescriptRemoveUnused<CR>",
        --       { desc = "Clear unused variables", buffer = buffer })
        --     vim.keymap.set("n", "gd", "<cmd>TypescriptGoToSourceDefinition<CR>",
        --       { desc = "Go to typescript source definition", buffer = buffer })
        --     -- vim.keymap.set("n", "<leader>ca", "<cmd>CodeActionMenu<CR>",
        --     --   { desc = "code action menu", buffer = buffer })
        --   end
        -- end)
        return true
      end,
    },
  },
  init = function()
    -- setup keymaps
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<leader>ca", "<cmd>CodeActionMenu<cr>", desc = "Code action menu" }
  end,
  ---@param opts PluginLspOpts
  config = function(_, opts)
    -- setup autoformat
    require("lazyvim.plugins.lsp.format").autoformat = opts.autoformat
    -- setup formatting and keymaps
    require("lazyvim.util").on_attach(function(client, buffer)
      require("lazyvim.plugins.lsp.format").on_attach(client, buffer)
      require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
    end)

    -- diagnostics
    for name, icon in pairs(require("lazyvim.config").icons.diagnostics) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end
    vim.diagnostic.config(opts.diagnostics)

    local servers = opts.servers
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local function setup(server)
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, servers[server] or {})

      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup["*"] then
        if opts.setup["*"](server, server_opts) then
          return
        end
      end
      require("lspconfig")[server].setup(server_opts)
    end

    local have_mason, mlsp = pcall(require, "mason-lspconfig")
    local available = have_mason and mlsp.get_available_servers() or {}

    local ensure_installed = {} ---@type string[]
    for server, server_opts in pairs(servers) do
      if server_opts then
        server_opts = server_opts == true and {} or server_opts
        -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
        if server_opts.mason == false or not vim.tbl_contains(available, server) then
          setup(server)
        else
          ensure_installed[#ensure_installed + 1] = server
        end
      end
    end

    if have_mason then
      mlsp.setup({ ensure_installed = ensure_installed })
      mlsp.setup_handlers({ setup })
    end

    require('ufo').setup()
  end,
}
