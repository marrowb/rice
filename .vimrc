" Brandon's ~/.vimrc
map <Space> <Leader>

"easy .vimrc reloading
" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :sp $MYVIMRC<cr>
" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

" Switch back to terminal
nmap <leader>t :stop<cr>

" Open netrw at current file's directory
nmap <leader>f :Explore<CR>

" Open netrw at current working directory
nmap <leader><s-f> :edit.<CR>
let g:netrw_altv = 1
let g:netrw_dirhistmax = 0

" Vim Slime Tmux Configuration
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}

" Colorscheme
syntax enable           " enable syntax processing
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Highlighting off
:noh
" Spaces & Tabs 
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" Use one space, not two, after punctuation.
set nojoinspaces
" UI Layout 
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load file-type specific indent files
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set scrolloff=4


"Search Settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Save Backups and Undos to /tmp, remove from working directory
" https://medium.com/@Aenon/vim-swap-backup-undo-git-2bf353caa02f

set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp// " // means directory info will be saved in file name

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif


"automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

call plug#begin('~/.vim/plugged')
"Junegunn special ones
let g:plug_url_format = 'git@github.com:%s.git'
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/junegunn/limelight.vim'
unlet g:plug_url_format
" LaTeX
Plug 'ying17zi/vim-live-latex-preview'
Plug 'xuhdev/vim-latex-live-preview'

" Color Schemes
Plug 'altercation/vim-colors-solarized'

" Writing
Plug 'reedes/vim-pencil'

" Tpope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

"File Finding
Plug 'ctrlpvim/ctrlp.vim'

" Chris Toomey 
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-runner'
Plug 'christoomey/vim-tmux-navigator'

"Linting
Plug 'dense-analysis/ale'

"Org-mode & Dependencies
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

" Vim Slime - send lines to ipython
Plug 'jpalardy/vim-slime'

call plug#end()

" Live Latex Settings
let g:livepreview_previewer = 'mupdf -r 180'
autocmd Filetype tex set 1 updatetime=10

"Vim Tmux Runner Plugins
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

