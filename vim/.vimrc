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
set clipboard=unnamed
set undofile
set ignorecase smartcase
set updatetime=300
set completeopt=menuone,noselect 
syntax enable
filetype plugin on
 
set path+=** " search down into subfolders
set wildmenu " display all mathching results

call plug#begin("~/plugged")
Plug 'makccr/hepburn'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/mbbill/undotree'
call plug#end()

colorscheme catppuccin_mocha
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

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <C-e> :Ex<CR>
nnoremap <C-f> :FZF<CR>
