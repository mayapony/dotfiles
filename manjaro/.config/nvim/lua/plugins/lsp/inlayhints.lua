return {
  "lvimuser/lsp-inlayhints.nvim",
  event = "LspAttach",
  config = function()
    require("lsp-inlayhints").setup()
  end
}
