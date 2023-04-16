return {
  'mg979/vim-visual-multi',
  build = function()
    os.execute("deno task --quiet build:fast");
  end,
}
