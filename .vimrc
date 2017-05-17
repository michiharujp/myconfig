if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/neocomplete.vim')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('scrooloose/nerdtree')
  call dein#add('joshdick/onedark.vim')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('itchyny/lightline.vim')
  call dein#add('othree/html5.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('hokaccha/vim-html5validator')
  call dein#add('pasela/unite-webcolorname')
  call dein#add('mattn/emmet-vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('kana/vim-submode')
  call dein#add('cohama/lexima.vim')
  if dein#check_install()
    call dein#install()
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" 画面表示の設定
set number
set cursorline
set laststatus=2
set cmdheight=2
set showmatch
set helpheight=999
set list
set background=dark
colorscheme hybrid

" カーソル移動関連の設定
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=8
set sidescrolloff=16
set sidescroll=1

" ファイル処理関連の設定
set confirm
set hidden
set autoread
set nobackup
set noswapfile

" 検索/置換の設定
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" タブ/インデントの設定
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
set history=10000

"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells

" インデント色の初期設定
let g:indent_guides_enable_on_vim_startup = 1

" NEADTree
map <C-n> <plug>NERDTreeTabsToggle<CR>
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" ファイル移動時_キーマッピング
nnoremap <space> <Nop>
nnoremap <space>j <C-w>j
nnoremap <space>k <C-w>k
nnoremap <space>l <C-w>l
nnoremap <space>h <C-w>h
nnoremap <space>J <C-w>J
nnoremap <space>K <C-w>K
nnoremap <space>L <C-w>L
nnoremap <space>H <C-w>H
nnoremap <space>r <C-w>r
nnoremap <space>= <C-w>=
nnoremap <space>w <C-w>w
nnoremap <space>o <C-w>_<C-w>|
nnoremap <space>O <C-w>=
nnoremap <space>t :<C-u>tabnew<CR>
nnoremap <space>T :<C-u>Unite tab<CR>
autocmd ColorScheme * highlight LineNr ctermfg = 244

" submodeによるウィンドウサイズの
call submode#enter_with('bufmove', 'n', '', '<space>>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', '<space><', '<C-w><')
call submode#enter_with('bufmove', 'n', '', '<space>+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', '<space>-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" 数の増減を行う
nnoremap + <C-a>
nnoremap - <C-x>

" Emmetのキーバインド
imap <C-e> <C-y>,

" カーソル移動のキーマップ
nnoremap j gj
nnoremap k gk
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" set 系コマンド
nnoremap <C-p>p :<C-u>set paste

" searchとペーストモード解除
nnoremap <Esc><Esc> :<C-u>noh<CR>:<C-u>set nopaste<CR>

" YとDとCの範囲揃えにする
nnoremap Y v$y
