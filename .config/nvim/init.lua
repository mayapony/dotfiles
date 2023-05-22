-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- vscode config
elseif vim.g.neovide then
  -- neovide config
  vim.o.guifont = "Source Code Pro:h12"
  vim.opt.linespace = 0
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_remember_window_size = true
end
require("config.lazy")
