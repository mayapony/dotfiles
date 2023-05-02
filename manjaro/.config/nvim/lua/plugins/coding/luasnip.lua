return {
  "L3MON4D3/LuaSnip",
  event = "VeryLazy",
  build = (not jit.os:find("Windows"))
      and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
      or nil,
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  config = function()
    local luasnip = require("luasnip")
    luasnip.filetype_extend("javascript", { "javascriptreact" })
    luasnip.filetype_extend("javascript", { "html" })
  end,
  opts = {
    history = true,
    delete_check_events = "InsertLeave",
    region_check_events = "InsertEnter"
  },
  -- stylua: ignore
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true,
      silent = true,
      mode = "i",
    },
    { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
    { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  },
}
