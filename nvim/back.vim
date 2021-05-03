" ********* 常用键位映射 *********** {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" 打开剪切历史
nnoremap <silent> <space><space>y :<C-u>CocList -A --normal yank<cr>
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Use <c-space> to trigger completion.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use <leader>h to show documentation in preview window
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>
" python
noremap <F5> :CocCommand python.execInTerminal<cr>
" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <silent> <F4> :TagbarToggle<CR> " 将tagbar的开关按键设置为 F4
nnoremap <C-b> :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap tp <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap tn <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>Q :bp<cr>:bd #<cr>
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" ********************************** }}}

" 基础设置
filetype plugin on
let mapleader="\<space>"
noremap <leader>y "+y
noremap <leader>p "+p
noremap J 5j
noremap K 5k
noremap <leader>j J
" 编码设置
if version >= 603
     set helplang=cn
     set encoding=utf-8
endif
set termencoding=utf-8
set fileencoding=utf-8

set number
set cursorline
set relativenumber
set shiftwidth=4
set expandtab
set softtabstop=4
set textwidth=80
set wrap
set linebreak
set wrapmargin=2
set scrolloff=5
set sidescrolloff=15
set showmatch
set autoindent
set tabstop=4

" 基础：搜索
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

set t_ut=
set t_Co=256 "指定配色方案为256


call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify' " 启动页面
Plug 'Yggdroot/indentLine' " 可视化缩进
Plug 'preservim/nerdtree' " 文件管理
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'

" Markdown.plug ====== {
Plug 'godlygeek/tabular' "必要插件，安装在vim-markdown前面
Plug 'plasticboy/vim-markdown' " markdown相关
Plug 'mzlogin/vim-markdown-toc' " 在当前光标生成目录
Plug '907th/vim-auto-save' " 自动保存
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'SirVer/ultisnips',{'for':'markdown'}

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight' " 加强C++高亮
" themes {{{
" Plug 'crusoexia/vim-monokai' " 主题
Plug 'liuchengxu/space-vim-dark' " 主题
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
" }}}

" Plug airline [[[
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
" ]]]

Plug 'preservim/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
call plug#end()

" ** indentLine 设置
let g:indent_guides_guide_size = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level = 2  " 从第二层开始可视化显示缩进

" ** vim-airline 设置
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'onedark'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" ** nerdTree 相关配置
" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ** tagbar 相关设置
let g:tagbar_width=30

" theme 设置
colorscheme dracula

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
 
 
" ===
" ====== markdown.config ====== {{{
let g:vim_markdown_math = 1

" ** vim-markdown-toc 设置
let g:vmt_auto_update_on_save = 0

" ** markdown-preview配置
" let g:mkdp_path_to_chrome = "exec /usr/bin/chromium"
let g:mkdp_auto_start = 1 "自动开启预览
let g:mkdp_markdown_css=''
" let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 1
"======preview

let g:auto_save = 0
augroup ft_markdown
  au!
  au FileType markdown let b:auto_save = 1
augroup END
let g:vim_markdown_conceal=0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
" ========================== }}}
" ===

" ===
" coc.config ====== {{{
let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-jedi',
    \ 'coc-cmake',
    \ 'coc-sh',
    \ 'coc-snippets',
    \ 'coc-yaml',
    \ 'coc-syntax',
    \ 'coc-yank',
    \ 'coc-python',
    \ 'coc-git',
    \ 'coc-highlight',
    \ 'coc-json',
    \ 'coc-vimlsp']

" if hidden is not set, TextEdit might fail.
set hidden
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100
" always show signcolumns
set signcolumn=yes
" don't give |ins-completion-menu| messages.
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 在同个词下会有提醒
autocmd CursorHold * silent call CocActionAsync('highlight')
set termguicolors

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a) 

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" =============== }}}




" nerdcommenter 设置 {{{
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" python 自动的会多加一个空格
au FileType python let g:NERDSpaceDelims = 0
 
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
 
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
 
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
 
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
 
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
 
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
 
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" }}}



