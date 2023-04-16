return {
  'toppair/peek.nvim',
  build = function()
    os.execute("deno task --quiet build:fast")
  end,
  config = function()
    vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
    vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
  end
}
