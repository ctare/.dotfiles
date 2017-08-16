if has('nvim')
  " ターミナルをESCで抜けられるように
  tnoremap <silent> <ESC> <C-\><C-n> 
endif

" colorscheme設定
" -----------------------------------------------------
set background=dark
autocmd VimEnter * colorscheme moneyforward
" -----------------------------------------------------

" モード切替
" -----------------------------------------------------
inoremap <silent> jj <ESC> 
" -----------------------------------------------------

" buffer設定
" -----------------------------------------------------
nnoremap f <Nop>
nnoremap <silent>fb :b#<CR>
nnoremap <silent>fn :bnext<CR>
nnoremap <silent>fp :bprevious<CR>
nnoremap <silent>fd :bd<CR>
" -----------------------------------------------------

" filetype設定
" -----------------------------------------------------
autocmd BufRead,BufNewFile *.rs setfiletype rust
autocmd BufRead,BufNewFile *.vue setfiletype html

autocmd FileType php :setlocal expandtab
autocmd FileType php :setlocal softtabstop=4
autocmd FileType php :setlocal shiftwidth=4
" -----------------------------------------------------

" タブ,ウインドウ設定
" -----------------------------------------------------
set scrolloff=1000 " 常にカーソルが真ん中に来るように
nnoremap s <Nop>
nnoremap st :<C-u>tabnew<CR>
nnoremap s= <C-w>=

" ウインドウ分割
nnoremap sv :sv<CR>
nnoremap vs :vs<CR>

" ウインドウ移動
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
" -----------------------------------------------------

" dein設定
" -----------------------------------------------------
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.config/nvim')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" -----------------------------------------------------

" 汎用設定
" -----------------------------------------------------
syntax on
filetype plugin indent on
set tabstop=2 shiftwidth=2 autoindent expandtab number mouse=a ambiwidth=double smartindent hidden
" -----------------------------------------------------
