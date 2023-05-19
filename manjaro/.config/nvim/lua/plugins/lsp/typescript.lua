return {
  "jose-elias-alvarez/typescript.nvim",
  ft = { "typescript", "typescriptreact" },
  dependencies = {
    {
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  config = function(_, opts)
    -- pull in the lspconfig server settings and use them for typescript setup
    local lsp_opts = require("lazyvim.util").opts("nvim-lspconfig")
    opts.server = lsp_opts.servers.tsserver
    require("typescript").setup(opts)
  end,
}
