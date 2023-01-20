-- pcall like try-catch (protect call)
local status, packer = pcall(require, "packer")

if (not status) then
  print('Packer is not installed')
  return 
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'EdenEast/nightfox.nvim'
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
end)
