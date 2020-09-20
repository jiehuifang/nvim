"===
"=== compatible setting
"===
set nocompatible

"===
"=== editor setting
"===
set encoding=utf-8
set number
set relativenumber
set cursorline
set wrap
set scrolloff=5
set autoindent
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" check spell
" set spell spelllang=en_us

"===
"=== status display
"===
set ruler
set showcmd
set wildmenu
set laststatus=2

"===
"=== search setting
"===
set hlsearch
set incsearch
set ignorecase
set smartcase

"===
"=== mouse setting
"===
set mouse=a

"===
"=== clipboard setting
"===
set clipboard+=unnamedplus

"===
"=== how to display space or tab
"===
set list
set listchars=tab:▸\ ,trail:▫

"===
"=== syntax setting
"===
syntax enable
syntax on

"===
"=== change dir setting
"===
set autochdir

"===
"=== filetype setting
"===
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"===
"=== key mapping
"===
" leader
let mapleader=" "

" map tabe
map <LEADER>u :tabe<CR>
map <LEADER>b :-tabnext<CR>
map <LEADER>n :+tabnext<CR>

" map control split enable
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

" map control split size
map <LEADER><up> :res-5<CR>
map <LEADER><down> :res+5<CR>
map <LEADER><left> :vertical resize-5<CR>
map <LEADER><right> :vertical resize+5<CR>

" map create split
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

" map my placehold
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

"===
"=== python setting
"===
set pyx=3

"===
"=== plugin setting
"===
call plug#begin('~/.vim/plugged')

" coc-nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" airline plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" a vim plugin which shows a git diff in the sign column
Plug 'airblade/vim-gitgutter'

" show the list of buffers in the command bar
Plug 'bling/vim-bufferline'

" icons (need install Nerd Font compatible font)
Plug 'ryanoasis/vim-devicons'

" vim theme
Plug 'NLKNguyen/papercolor-theme'

" auto pair ()
Plug 'jiangmiao/auto-pairs'

" Code Comment
Plug 'preservim/nerdcommenter'

" git plugin
Plug 'tpope/vim-fugitive'

" leaderF finder (need install gtags, ripgrep)
Plug 'Yggdroot/LeaderF'

call plug#end()

"===
"=== coc setting
"===
" coc extensions
let g:coc_global_extensions = [
    \ 'coc-actions',
    \ 'coc-css',
    \ 'coc-diagnostic',
    \ 'coc-explorer',
    \ 'coc-flutter-tools',
    \ 'coc-gitignore',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-java',
    \ 'coc-lists',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-python',
    \ 'coc-snippets',
    \ 'coc-sourcekit',
    \ 'coc-stylelint',
    \ 'coc-syntax',
    \ 'coc-tasks',
    \ 'coc-todolist',
    \ 'coc-translator',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-vetur',
    \ 'coc-yaml',
    \ 'coc-yank']

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-l> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-l> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" map open explorer
nmap <space>e :CocCommand explorer<CR>

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" coc-snippets
let g:snips_author = 'fangjiehui'
let g:coc_snippet_prev = '<c-b>'
let g:coc_snippet_next = '<c-m>'

" loading special coc-settings
if has('unix')
    let g:coc_config_home='$MYNVIM/unix/'
elseif has('win32')
    let g:coc_config_home='F:\\repo\\nvim\\win32\\'
else
endif

" ===
" === vim theme
" ===
set background=dark
colorscheme PaperColor

" ===
" === airline settings
" ===
" Always show status
set laststatus=2
" support powerline
let g:airline_powerline_fonts = 1
" display tab & buffer
let g:airline#extensions#tabline#enabled = 1
" airline theme
let g:airline_theme='onedark'

" ===
" === leaderF settings
" ===
noremap <c-p> :Leaderf file<CR>
noremap <LEADER>f :Leaderf rg -e
let g:Lf_WorkingDirectoryMode = 'a'
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_ShowHidden = 1
