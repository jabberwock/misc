" vim -b : edit binary using xxd-format!
augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END

" switch to hex editing mode
nnoremap ^[x :%!xxd<CR>

" strip trailing whitespace on save
autocmd BufWritePre *.* :%s/\s\+$//e

set nocompatible

set autoindent
set backspace=indent,eol,start
set encoding=utf8
set expandtab
set foldmethod=marker
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set listchars=tab:▸\ ,eol:¬
set mouse=a
set number
set ruler
set shiftwidth=4
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set textwidth=0
set ttymouse=xterm
set visualbell
set t_vb=
set wildmenu

au BufRead,BufNewFile * match ErrorMsg  /[ \t]\+$/
"au BufRead,BufNewFile * match ErrorMsg   /\%>80v.\+/

" Things to think about when using xterm
if has("xterm_clipboard")
    behave xterm
    set t_Co=256
else
    set t_Co=16
    set paste
    set clipboard+=unnamed
endif

" set vim to chdir for each file
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif


let s:host_vimrc = $HOME . '/.' . hostname() . '.vimrc'
if filereadable(s:host_vimrc)
    execute 'source ' . s:host_vimrc
endif

syntax on
filetype plugin on
filetype indent on
