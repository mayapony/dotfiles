return {
  "L3MON4D3/LuaSnip",
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


    -- forget the current snippet when leaving the insert mode
    -- source: https://github.com/L3MON4D3/LuaSnip/issues/656
    local unlinkgrp = vim.api.nvim_create_augroup(
      'UnlinkSnippetOnModeChange',
      { clear = true }
    )

    vim.api.nvim_create_autocmd('ModeChanged', {
      group = unlinkgrp,
      pattern = { 's:n', 'i:*' },
      desc = 'Forget the current snippet when leaving the insert mode',
      callback = function(evt)
        if
            luasnip.session
            and luasnip.session.current_nodes[evt.buf]
            and not luasnip.session.jump_active
        then
          luasnip.unlink_current()
        end
      end,
    })
  end,
  opts = {
    history = true,
    delete_check_events = "TextChanged",
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
