require('base')
require('highlights')
require('maps')
require('plugins')

-- has 如果功能支持则返回1
local has = vim.fn.has
local is_linux = has "linux"

if vim.g.neovide then
  print("neovide")
  vim.opt.guifont = { "Source Code Pro", "h30" }
end

if is_linux then
  require('linux')
end
