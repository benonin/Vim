" basic settings ------------------- {{{
let mapleader=","
let maplocalleader=","
"set relativenumber
set number
set numberwidth=4
set tabstop=4
set wrap
set foldlevel=0
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
" other mapping ------------------- {{{
noremap <leader>- ddp   "swap line with following
noremap <leader>_ kddpk	"swap line with previous
inoremap <leader>u <esc>veUi
nnoremap <leader>u veU<esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
iabbrev @@ benkoop@t-online.de
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>' <esc>a'<esc>`<i'<esc>
onoremap in( :<c-u>normal! f(vi(<cr>	" clear next paranthesis
onoremap il( :<c-u>normal! F)vi(<cr>	" clear last paranthesis
" }}}
" unmapped keys ------------------- {{{
noremap <esc> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
inoremap <esc> <nop> 
noremap $ <nop>
noremap 0 <nop>
" }}}
" basic mappings ------------------- {{{
inoremap jk <esc>
vnoremap jk <esc>
nnoremap H 0
nnoremap L $
" }}}

" python file settings ------------------- {{{
augroup filetype_python
	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>	" comment line out
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
augroup END
" }}}
" Vimscript file settings ------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
