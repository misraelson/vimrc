" =============================================================================
"      FileName: vimrc
"        Author: Matthew Israelson 
"         Email: matthew.israelson@joist.com
"       Created: 2021
"       Version: 0.0.1
"    LastChange: 25-07-2021
" =============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM CONFIG 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't try to be vi compatible
set nocompatible
" Helps force plugins to load correctly when it is turned back on below
filetype off


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Plug for Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Place the following code in your .vimrc before plug#begin() call to automate downloading vim.plug and putting in autocmd directory
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs 
"  		\	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" " Install vim-plug if not found
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" endif

" " Run PlugInstall if there are missing plugins
" autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"   \| PlugInstall --sync | source $MYVIMRC
" \| endif

call plug#begin('~/.vim/plugged')
"{{ The Basics }}
	Plug 'glepnir/oceanic-material'
	Plug 'tomasiser/vim-code-dark'
	Plug 'sheerun/vim-polyglot'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
"{{ Syntax Highlighting and Colors }}
	" Plug 'pangloss/vim-javascript'    														" A Vim syntax highlighting plugin for JavaScript
	" Plug 'leafgarland/typescript-vim' 														" TypeScript syntax
	" Plug 'chemzqm/vim-jsx-improve'
	Plug 'ap/vim-css-color'                                       " Color previews for CSS
	Plug 'jiangmiao/auto-pairs'
"{{ File management }}
	Plug 'scrooloose/nerdtree'                                    " Nerdtree
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                " Highlighting Nerdtree
	Plug 'ryanoasis/vim-devicons'                                 " Icons for Nerdtree
"{{ COCompletion + FZFinder  }}
	Plug 'neoclide/coc.nvim', {'branch': 'release'}               " Use release branch
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }           
	Plug 'junegunn/fzf.vim'
	Plug 'mbbill/undotree'
	" Debugger Plugins
	" Plug 'szw/vim-maximizer'
"{{ Tim Pope Plugins }}
	Plug 'vim-ruby/vim-ruby'                                      " Vim's Ruby runtime support
	Plug 'tpope/vim-rails'                                        " Ruby on Rails power tools
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'                                     " Change surrounding marks
	Plug 'tpope/vim-unimpaired'                                   " Move things around with [e & ]e commands
	Plug 'tpope/vim-repeat'                                   		" use the . command after a plugin map 
call plug#end()
" :PlugInstall                                                  - installs plugins; append `!` to update or just :PlugUpdate
" :PlugSearch foo                                               - searches for foo; append `!` to refresh local cache
" :PlugClean                                                    - confirms removal of unused plugins; append `!` to auto-approve removal


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable on 																										" Turn on syntax highlighting
filetype plugin indent on 																					" For plugins to load correctly
set encoding=utf-8 																									" Encoding
set t_Co=256                                                        " Set if term supports 256 colors.
" set t_ut= 																												" to disable Background Color Erase.
set path+=**                                              					" Searches current directory recursively.
set nowrap
set wildmenu					                                              " Display all matches when tab complete.
set incsearch hlsearch smartcase                                    " Incremental search
set cursorline                                                      " Highlight the current line
" set virtualedit=onemore                                             " Allow for cursor beyond last character
set nolist 																													" eliminte eol and tab characters
set foldenable                                                      " Enable Fold
set foldcolumn=1
set foldexpr=1                                                      " Shown line number after fold
set hidden                                                          " Switch between buffers with unsaved change
set nobackup                                                        " No auto backups
set noswapfile                                                      " No swap
set number relativenumber                                           " Display line numbers

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2                                                       " One tab == two spaces.
set shiftwidth=2                                                    " The tab width by using >> & <<
set formatoptions-=cro 																							" disable continuation of comments to the next line
set noexpandtab 																										" what does this do?
set backspace=2 																										" make backspace work like most other programs
set backspace=indent,eol,start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr
set so:100 																													" Keep cursor center of the screen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undodir=~/.vim/undo/
set undofile
noremap <space>u :UndoToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme + Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set colorcolumn=120
colorscheme codedark

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'codedark'

set cmdheight=2   																									" Give more space for displaying messages.
set noshowmode                                                      " Uncomment to prevent non-normal modes showing in powerline and below powerline.
set showmatch                                                       " Show matching bracets (shortly jump to the other bracets)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

     "{{ Normal Mode Remaps  }}
nnoremap <Space> :
" SHIFT-TAB enter new line above cursor
nnoremap <S-tab> O<esc>j
" nmap <S-Enter> O<Esc>
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap Y y$
nnoremap <silent> <F6> :bn<CR>
nnoremap <silent> <F5> :bp<CR>
" nnoremap <silent> <esc> :noh<CR>
" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

    "{{ Insert Mode Remaps  }}
" Remap ESC to ii
:imap ii <Esc>
" CTRL-z undo
inoremap <C-z> <C-o>
" CTRL-a goto beginning of line
inoremap <C-a> <ESC>I
" CTRL-e goto end of line
inoremap <C-e> <ESC>A

    "{{ Visual Mode Remaps  }}
vnoremap ii <Esc> 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vmap s <Plug>VSurround


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto command to return where you were in file when you closed it
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FzF Mappings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" find files with fzf
nnoremap <silent> <C-f> :Files<CR>
" find files using gitignore with fzf
nnoremap <silent> <C-g> :GFiles<CR>
" find IN files with RipGrep
" nnoremap <silent> <C-r> :Rg<CR>
" find a buffer aka file thats open
nnoremap <silent> <C-b> :Buffers<CR>
" search lines of current buffer
nnoremap <silent> <space>/ :BLines<CR>
" With below FZF + ripgrep will not consider filename as a match in Vim
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
" Open NERDTree in current files directory
nnoremap <C-m> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC Auto-Completer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <space>rn <Plug>(coc-rename)

" Formatting selected code.
vmap <space>f  <Plug>(coc-format-selected)
nmap <space>f  <Plug>(coc-format-selected)

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']
" command! -nargs=0 Prettier :CocCommand prettier.formatFile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight NERDTreeClosable ctermfg=2
highlight NERDTreeOpenable ctermfg=8
 " highlight cursor line with color
highlight CursorLine       ctermfg=none    ctermbg=238     cterm=none
highlight CursorLineNr     ctermfg=111     ctermbg=none    cterm=none
highlight ColorColumn      ctermfg=96      ctermbg=235     cterm=none
" highlight Comment          ctermfg=black    ctermbg=lightblue    cterm=italic
highlight Folded           ctermfg=103     ctermbg=234     cterm=none
highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
" highlight LineNr           ctermfg=111   ctermbg=54    cterm=none
" highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
" highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
" highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
" highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
" highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
" highlight Statement        ctermfg=2    ctermbg=none    cterm=none
" highlight Directory        ctermfg=4    ctermbg=none    cterm=none
" highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
" highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
" highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
" highlight Constant         ctermfg=12   ctermbg=none    cterm=none
" highlight Special          ctermfg=4    ctermbg=none    cterm=none
" highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
" highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
" highlight String           ctermfg=12   ctermbg=none    cterm=none
" highlight Number           ctermfg=1    ctermbg=none    cterm=none
" highlight Function         ctermfg=1    ctermbg=none    cterm=none
" highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none
" highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
" highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
" highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
" highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
" highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
" highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
" highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
" highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
" highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
" highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
" highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
" highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
" highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
" highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
" highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
" highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => END OF CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
