return {
  "windwp/nvim-ts-autotag",
  dependencies = { "nvim-treesitter" },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      autotag = {
        enable = true,
      },
    })
  end,
}
