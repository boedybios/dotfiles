" ============================================================================
" PLUGINS
" ============================================================================
" Plugins will be downloaded under the specified directory.
if has('nvim')
        call plug#begin('~/.config/nvim/plugged')
else
        call plug#begin('~/.vim/plugged')
endif

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Better file browser
Plug 'scrooloose/nerdtree'

" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'

" quoting/parenthesis made simple
Plug 'tpope/vim-surround'

" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'

" Eclipse TaskList
Plug 'vim-scripts/TaskList.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Better language packs
Plug 'sheerun/vim-polyglot'

" Easy code formatting
Plug 'chiel92/vim-autoformat'

" Git integration
Plug 'tpope/vim-fugitive'

" Large collection of vim colorschemes
Plug 'flazz/vim-colorschemes'

if has('nvim')
        " Provides an extensible and asynchronous completion framework for neovim/Vim8.
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        " Python autocompletion
        Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
else
        " Provides an extensible and asynchronous completion framework for neovim/Vim8.
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
        " Python autocompletion
        Plug 'zchee/deoplete-jedi'
endif

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" ============================================================================
" CUSTOM MAPPINGS
" ============================================================================
" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" tab navigation mappings
map tt :tabnew
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>
" clear search results
nnoremap <silent> // :noh<CR>


" ============================================================================
" FZF CONFIGURATION
" ============================================================================
nnoremap <C-p> :<C-u>FZF<CR>


" ============================================================================
" TASKLIST CONFIGURATION
" ============================================================================
" show pending tasks list
map <F2> :TaskList<CR>


" ============================================================================
" NERDTREE CONFIGURATION
" ============================================================================
" automatically open nerdtree when no file name specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" ============================================================================
" NERDCOMMENTER CONFIGURATION
" ============================================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'


" ============================================================================
" DEOPLETE CONFIGURATION
" ============================================================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'


" ============================================================================
" JEDI-VIM CONFIGURATION
" ============================================================================
" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0


" ============================================================================
" AIRLINE CONFIGURATION
" ============================================================================
" set airline theme
let g:airline_theme = 'wombat'
" displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
" separators can be configured independently for the tablne
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1


" ============================================================================
" COLORSCHEME CONFIGURATION
" ============================================================================
let g:seoul256_background = 234

"colorscheme kolor
"coloscheme space-vim-dark
"colorscheme dracula
"colorscheme seoul256
"colorscheme seti
"colorscheme darkspectrum
colorscheme wombat

" ============================================================================
" AUTOFORMAT CONFIGURATION
" ============================================================================
" Autoformat upon saving file
autocmd BufWrite * :Autoformat
" enable/diable verbose mode
let g:autoformat_verbosemode=0


" ============================================================================
" GLOBAL CONFIGURATION
" ============================================================================
" enable syntax highlighting (previously syntax on).
syntax enable

" show the line number
set number

" show the relative number
set relativenumber

" show cursor line
set cursorline

" show the tab bar
set showtabline=2

" makes copy and paste work better
set clipboard=unnamedplus

" automatic indentation
set autoindent
set smartindent

" use spaces instead of tabs
set expandtab

" use tabs at the start of a line, spaces elsewhere
set smarttab

" don't wrap text
set nowrap

" make completion smarter.
set ignorecase
set smartcase

" Automatically re-open files after they have changed without prompting.
set autoread

set visualbell
set termguicolors

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest
