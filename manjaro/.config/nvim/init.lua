-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- vscode config
else
  require("config.lazy")
end
