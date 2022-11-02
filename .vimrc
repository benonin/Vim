execute pathogen#infect('bundle/{}', '~/src/vim/bundle/{}')
" basic settings ------------------- {{{
let mapleader=","
let maplocalleader=","
let &relativenumber=1
let &number=1
let &numberwidth=4
let &tabstop=4
let &shiftwidth=4
let &wrap=1
set foldmethod=indent
let &foldlevel=0
let &scrolloff=7
colorscheme gruvbox
set background=dark
syntax enable
" }}}
" statusline settings ------------------- {{{
set laststatus=2		"statusline always on
set statusline=%.30F	"last 30 characters of Full path
set statusline+=\ -\
set statusline+=FileType
set statusline+=%y		"Show FileType
set statusline+=%=		"Switch to the right side
set statusline+=%l		"Current line
set statusline+=/		"Separator
set statusline+=%L		"Total lines
:filetype on
" }}}
" useful mappings ------------------- {{{
"swap line with following
noremap <leader>- ddp
noremap <leader>_ kddpk	"swap line with previous
inoremap <leader>u <esc>veUi
nnoremap <leader>u veU<esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>' <esc>a'<esc>`<i'<esc>
onoremap in( :<c-u>normal! f(vi(<cr>	" clear next paranthesis
onoremap il( :<c-u>normal! F)vi(<cr>	" clear last paranthesis
onoremap lb :execute "rightbelow vsplit " . bufname("#")<cr>	"open last buffer rightbelow
nnoremap <localleader>; :execute "normal! mqA;\e`q"<cr>	"enter ;
nnoremap <localleader>s :w<cr>:source %<cr>		"save and reload
nnoremap R :redo<cr>
" }}}
" iabbrevetions --------------------- {{{
iabbrev @@ benkoop@t-online.de
iabbrev nn nnoremap
iabbrev lo localleader>
" }}}
" search and match setting ------------------------- {{{
let &hlsearch=1
let &incsearch=1
:highlight Error ctermbg=red guibg=red
nnoremap <localleader>w :match Error /\v +\n/<cr> 	"match trailing whitespaces
"clear match:
nnoremap <localleader>W :match none<cr>
nnoremap <localleader>F :let &hlsearch=1<cr> /\v
"stop highlighting
nnoremap <localleader>m :nohlsearch<cr>
"nnoremap <localleader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen 8<cr>
nnoremap <localleader>n :cnext<cr>
nnoremap <localleader>N :cprevious<cr>
nnoremap <localleader>. /\.<cr> :nohlsearch<cr>h
vnoremap <localleader>. /\.<cr>
" }}}
" unmapped keys ------------------- {{{
noremap <esc> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
inoremap <esc> <nop> 
"noremap $ <nop>
"noremap 0 <nop>
" }}}
" basic mappings ------------------- {{{
inoremap jk <esc>
vnoremap jk <esc>
nnoremap H 0
nnoremap L $
vnoremap H ^
vnoremap L g_
nnoremap J 10j<cr>
nnoremap K 10k<cr>
" }}}
" {{{ FoldColumnToggel
nnoremap <localleader>f :call <SID>FoldColumnToggel()<cr>
function! s:FoldColumnToggel()
	if &foldcolumn
		setlocal foldcolumn=0
	else
		setlocal foldcolumn=4
	endif
endfunction
" }}}
" {{{ QuickfixToggle
nnoremap <localleader>q :call <SID>QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! s:QuickfixToggle()
	if g:quickfix_is_open
		cclose
		let g:quickfix_is_open = 0
		execute g:quickfix_return_to_window . "wincmd w"
	else
		let g:quickfix_return_to_window = winnr()
		copen
		let g:quickfix_is_open = 1
	endif
endfunction
" }}}
" python file settings ------------------- {{{
augroup filetype_python
autocmd!
autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>	" comment line out
autocmd FileType python nnoremap <buffer> <localleader>C ^x<esc>	" comment line in
autocmd FileType python iabbrev <buffer> iff if:<left>	" insert if
autocmd FileType python onoremap <buffer> ih :<c-u>execute "normal! ?^##\\+$\r:nohlsearch\rkvg_"<cr>
autocmd FileType python onoremap <buffer> ah :<c-u>execute "normal! ?^##\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}
" c and cpp file settings ------------------- {{{
augroup filetype_c_cpp
autocmd!
autocmd FileType c,cpp nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType c,cpp iabbrev <buffer> buffer> iff if ()<left>
autocmd FileType c,cpp onoremap <buffer> ih :<c-u>execute "normal! ?^\/\*\{2,}\/$\r:nohlsearch\rkfg_"<cr>
autocmd FileType c,cpp onoremap <buffer> ah :<c-u>execute "normal! ?^\/\*\{2,}\/$\r:nohlsearch\rg_vk0"<cr>
autocmd FileType c,cpp vim setlocal foldmethod=potion
augroup END
" }}}
" Vimscript file settings ------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Latex file settings ------------------- {{{
filetype plugin on
filetype indent on
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_GotoError=0
"let g:Tex_CompileRule_pdf='arara -v $*'
"let g:Tex_ViewRule_pdf = 'Dokumentenbetrachter'
"augroup filetype_tex
"	autocmd!
"augroup END
" }}}


" used keys with leader:
" c,f,g,m,n,q,s,u,w
" C,F,H,J,K,L,N,W
" ah,ev,ih,sv
" -,_,',;
"used keys for onoremappings:
" il(,in(,lb
" used keys for remaps:
" R
