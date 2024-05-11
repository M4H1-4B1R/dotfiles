:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set termguicolors
:set cursorline

call plug#begin("~/plugged")
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

:colorscheme catppuccin_mocha
hi Normal guibg=NONE ctermbg=NONE

:set laststatus=2
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

