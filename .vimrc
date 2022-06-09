"test on
"Activate indentation
filetype off
filetype plugin indent on
set smartindent

"Non-expanded, 4-wide tabulations
set tabstop=4
set shiftwidth=4
set noexpandtab

"Disable vi-compatibility
set nocompatible

"Real-world encoding
set encoding=utf-8

"Interpret modelines in files
set modelines=1

"Do not abandon buffers
set hidden

"Don't bother throttling tty
set ttyfast

"More useful backspace behavior
set backspace=indent,eol,start

"Use statusbar on all windows
set laststatus=2

"Better search
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
"test off"

syntax enable
syn on
filetype plugin on

set path+=**
set wildmenu

set mouse+=a
set number
set ruler
set noerrorbells visualbell t_vb=
set nocompatible

"set tabstop=4        " tab width is 4 spaces
"set shiftwidth=4     " indent also with 4 spaces
"set autoindent
"set smartindent
set showmatch

" Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor
" down one entire line. with line wrapping on, this can cause the cursor
" to actually skip a few lines on the screen because it's moving from
" line N to line N+1 in the file. I want this to act more visually
" I want `down' to mean the next line on the screen
nmap j gj
nmap k gk

"подсвечивает синим строку, если та будет превышать 80 знаков
highlight MoreThan80 ctermbg=blue guibg=blue
:2match MoreThan80 /\%81v.\+/

"добавляет ) после написания символа (
inoremap ( ()<left>
inoremap () ()


"добавляет } после написания символа {
inoremap { {}<Left><enter><up><end>
inoremap {} {}<Left>


"добавляет " после написания символа "
inoremap " ""<left>
inoremap "" ""


"добавляет ' после написания символа '
inoremap ' ''<left>
inoremap '' ''


inoremap [ []<left>
inoremap [] []

"map <C-k> <C-w><Up>

"map <C-j> <C-w><Down>

map <C-l> <C-w><Right>

map <C-h> <C-w><Left>

nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap tn :tabnew<CR>

nnoremap te :tabfind<Space>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-s> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


set tabpagemax=50

map <Space> <Leader>

set autoread
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
""map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
command! MakeTags !ctags -R

packadd! sonokai

" Important!!
if has('termguicolors')
  set termguicolors
endif

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0

colorscheme sonokai



set tags=tags
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>


" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif












set showcmd
