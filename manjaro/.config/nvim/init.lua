-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- vscode config
elseif vim.g.neovide then
  -- neovide config
  vim.o.guifont = "Source Code Pro:h14"
  vim.opt.linespace = 0
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_transparency = 0.8
else
  require("config.lazy")
end
