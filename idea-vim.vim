"==========================================
" Author:  maya
" Version: 0.1
" Email 1327909321@qq.com
" Desc: my ideavim config file
"==========================================
" set leader key
let mapleader="\<Space>"
let g:mapleader="\<Space>"

" 行号的显示形式
set number
set relativenumber



" 搜索相关的设置
set hlsearch
set incsearch
set smartcase
set ignorecase

" 一些插件
set easymotion
set surround
set multiple-cursors
set highlightedyank
let g:highlightedyank_highlight_duration = 1000
set exchange " cx cxx X cxc
set commentary
:set keep-english-in-normal
:set keep-english-in-normal-and-restore-in-insert
set sneak
set NERDTree

" 基础的键位映射
nnoremap L $
nnoremap H ^
vnoremap L $
vnoremap H ^
nnoremap J 5j
vnoremap J 5j
nnoremap K 5k
vnoremap K 5k
nnoremap + :action XSplitIncSize<Cr>
nnoremap - :action XSplitDecSize<Cr>


" clear the highlighted search result
nnoremap <Leader>nh :nohlsearch<CR>

" 复制粘贴相关操作
noremap <Leader>y "*y
noremap <Leader>p "*p

" Tab operation
nnoremap tn gt
nnoremap tp gT

" Insert mode shortcut
" inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Quit normal mode
nnoremap <leader>q  :wq<CR>
nnoremap <leader>Q  :q!<CR>

inoremap <C-[> <Esc>`^

" intellij built in key map
nnoremap <leader>a :action GotoAction<CR>
nnoremap <leader>b :action Bookmarks<CR>
nnoremap <leader>c :action GotoClass<CR>
nnoremap <leader>e :action SearchEverywhere<CR>
nnoremap <leader>f :action FindInPath<CR>
nnoremap <leader>gc :action Git.CompareWithBranch<CR>
nnoremap <leader>gr :action Git.ResolveConflicts<CR
nnoremap <leader>ga :action Annotate<CR>
nnoremap <leader>r :action RecentFiles<CR>
nnoremap <leader>fs :action FileStructurePopup<CR>
nnoremap <leader>ov :action OverrideMethods<CR>
nnoremap <leader>im :action ImplementMethods<CR>
" navigation
nnoremap gs :action GotoSuperMethod<CR>
nnoremap gb :action JumpToLastChange<CR>
nnoremap gi :action GotoImplementation<CR>
nnoremap gd :action GotoDeclaration<CR>
nnoremap gr :action RenameElement<CR>

" code actions
nnoremap U :action FindUsages<CR>
nnoremap R :action RenameElement<CR>
nnoremap == :action ReformatCode<CR>
vnoremap = :action ReformatCode<CR>
nnoremap cc :action CommentByLineComment<CR>
vnoremap cc :action CommentByLineComment<CR>
inoremap <C-v> <Esc>l:action EditorPaste<CR>i


set showcmd
set wildmenu
set scrolloff=5

" Flutter action