" 基础设置
lua require('basic')
" Packer插件管理
lua require('plugins')
" 快捷键映射
lua require('keybindings')
" 皮肤设置
" https://github.com/ellisonleao/gruvbox.nvim
set background=dark " or light if you want light mode
colorscheme gruvbox

" 插件配置
lua require('plugin-config/which-key')
lua require('plugin-config/nvim-treesitter')
lua require('plugin-config/telescope')
lua require('plugin-config/nvim-autopairs')
lua require('plugin-config/nvim-tree')
lua require('plugin-config/bufferline')
lua require('plugin-config/surround')
lua require('plugin-config/comment')
lua require('plugin-config/nvim-colorizer')
lua require('plugin-config/rust-tools')

" lsp
lua require('lsp/nvim-cmp-config')
lua require('lsp/diagnostic_signs')
lua require('lsp/language_servers')

" 复制到windows剪贴板
" https://stackoverflow.com/questions/44480829/how-to-copy-to-clipboard-in-vim-of-bash-on-windows
autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif

" magic search
nnoremap / /\v
vnoremap / /\v
