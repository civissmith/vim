""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @Title: .vimrc
"
" @Author: Phil Smith 
"
" @Date: <UNKNOWN>
"
" @Project: Personal Vim Config
"
" @Purpose: This file sets up various Vim features, shortcuts and preferences
"           based on how I like to Vim.
"
" @Modification History: 
"  Date      Author      Description
"  --------  ----------  ------------------------------------------------------
"  26Jan13   PAS         Added standard header and prepped for Git.
"  28Jun14   PAS         Updates over the last year
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

"
" Disable 'Ex' mode - launch command history instead.
"
nnoremap Q q:

"
" Show highlighting groups for current word
"
nmap <C-S-P> :call <SID>SynStack()<CR>
fun! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfun

"
" Add a new leader button for more custom commands
" ( This should be BEFORE anything that uses the new leader )
"
let mapleader=','
nnoremap <leader>w :w<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>s :s/

"
" Set colorscheme
"
colorscheme achilles

"
" Don't reach for ESC
"
inoremap \\ <ESC>

"
" auto reload vimrc when editing it
"
autocmd! bufwritepost .vimrc source ~/.vimrc

"
" Sorry Vi, this is Vim's house.
"
set nocompatible

"
" Use the tab key instead of % to move between bracket pairs
"
nnoremap <tab> %
vnoremap <tab> %

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"
" Setup syntax highlighting, search preferences and whitespace preferences
"
syntax on
set incsearch  " INCremental search
set hls        " HighLight Search 
set expandtab
set ts=3       " Tab Stops
set sw=3       " Shift Width
set sts=3      " Soft Tab Stop - should match shift width
set ignorecase

"
" Setup word wrapping, and window settings
"
set nowrap
set ruler
set background=dark

"
" Prompt if buffer has not been written instead of failing the command
"
set confirm

"
" Set cursor column and cursor line
"
nnoremap <silent> <C-S-K> :set cursorcolumn!<cr>
nnoremap <silent> <C-S-L> :set cursorline!<cr>
" Switch back to insert mode if already in insert
inoremap <silent> <C-S-K> <esc>:set cursorcolumn!<cr>a
inoremap <silent> <C-S-L> <esc>:set cursorline!<cr>a


"
" Setup shortcut keys for splitting, (de)selecting numbers, search highlighting
" buffer switching, window moving and resizing
"
nnoremap <silent> <F4> :vsplit<CR>
nnoremap <silent> <S-F5> :split<CR>
" Switch back to insert mode if already in insert
inoremap <silent> <F4> <esc>:vsplit<CR>a
inoremap <silent> <S-F5> <esc>:split<CR>a

" Fast buffer switching
nnoremap <silent> <F5> :buffers!<CR>:buffer<Space>
" No need to go back to insert since we might switch buffer
inoremap <silent> <F5> <esc>:buffers!<CR>:buffer<Space>

"
" Set relativenumber to give lines-from-current instead of absolute
" (>= Vim 7.3)
"
nnoremap <silent> <F6> :set nu!<CR>
nnoremap <silent> <F7> :set relativenumber!<CR>
nnoremap <silent> <F8> :set hls<CR>
nnoremap <silent> <F9> :nohls<CR>
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <S-Up> <C-w>k
nnoremap <silent> <S-Down> <C-w>j
nnoremap <silent> <S-Left> <C-w>h
nnoremap <silent> <S-Right> <C-w>l


" Switch back to insert mode if already in insert
inoremap <silent> <F6> <esc>:set nu!<CR>a
inoremap <silent> <F7> <esc>:set relativenumber!<CR>a
inoremap <silent> <F8> <esc>:set hls<CR>a
inoremap <silent> <F9> <esc>:nohls<CR>a

"
" Create a file type and preference set for personal "note" files.
"
au BufNewFile,BufRead  *.note :set tw=0 wrap linebreak 
au BufNewFile,BufRead  *.note colorscheme delek

"
" Setup environment for Python Files
"
au BufNewFile,BufRead  *.py :set expandtab ts=2 sw=2 sts=2
au BufNewFile,BufRead  *.py :set foldmethod=manual
au BufNewFile,BufRead  *.py :so ~/.vim/plugin/RainbowParenthsis.vim
au BufNewFile,BufRead  *.py3 :set expandtab ts=2 sw=2 sts=2
au BufNewFile,BufRead  *.py3 :set foldmethod=manual
au BufNewFile,BufRead  *.py3 :so ~/.vim/plugin/RainbowParenthsis.vim

"
" Setup environment for Makefiles
"
autocmd FileType make setlocal noexpandtab

"
" Setup Auto-completion
"
inoremap <leader>p <C-P>
inoremap <leader>n <C-N>

au VimResized * exe "normal! \<c-w>="
