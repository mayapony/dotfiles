local configs = require("nvim-treesitter.configs")

return {
  "windwp/nvim-ts-autotag",

  config = function()
    configs.setup({
      autotag = {
        enable = true,
      },
    })
  end,
}
