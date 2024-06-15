set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set cursorline
set nocompatible
set background=dark
set termguicolors
syntax enable
filetype plugin on

set path+=** " search down into subfolders
set wildmenu " display all mathching results

call plug#begin("~/plugged")
"Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'makccr/hepburn'
call plug#end()

colorscheme hepburn
hi Normal guibg=NONE ctermbg=NONE

set laststatus=2
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#Folded#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#StatusLine#
set statusline+=\ %F
set statusline+=%=
set statusline+=%#Folded#
set statusline+=\ %l/%L
set statusline+=%{StatuslineGit()}

