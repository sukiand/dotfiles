set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" keyword completion system 
" Key: Tab
Plugin 'Shougo/neocomplete.vim'
" comment
" Key: gcc
Plugin 'tpope/vim-commentary'
" The NERD tree allows you to explore your filesystem and to open files and
" directories.
" Key: F7
Plugin 'scrooloose/nerdtree'
" Show the structure
" Key: F8
Plugin 'majutsushi/tagbar'
" color for parentheses
" Key: auto
Plugin 'luochen1990/rainbow'
" This plugin is used for displaying thin vertical lines at each indentation
" level for code indented with spaces
" Key: auto
Plugin 'Yggdroot/indentLine'
" syntax and indent plugin for js
" Key: auto
Plugin 'pangloss/vim-javascript'
" all trailing whitespace characters (spaces and tabs) to be highlighted
" Key: auto
Plugin 'ntpeters/vim-better-whitespace'
" Use Clang to complete c++
" Key: auto
Plugin 'osyo-manga/vim-marching'
" Powerful syntax checking 
" Key: auto
Plugin 'scrooloose/syntastic'
" fuzzy finding
" Command: :CtrlP
Plugin 'kien/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'digitaltoad/vim-jade'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/mru.vim'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""
" Conf for neocomplete "
""""""""""""""""""""""""
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"""""""""""""""""""""
" Conf for nerdtree "
"""""""""""""""""""""
noremap <F7> <ESC>:NERDTreeToggle<CR>

"""""""""""""""""""
" Conf for tagbar "
"""""""""""""""""""
nnoremap <F8> <ESC>:Tagbar<CR>

""""""""""""""""""""""""""""
" Conf for vim-javascripts "
""""""""""""""""""""""""""""
let g:javascript_enable_domhtmlcss= 0

"""""""""""""""""""""""""
" Conf for vim-marching "
"""""""""""""""""""""""""
let g:marching_clang_command = "/usr/bin/clang"
let g:marching_include_paths = [
      \ "/usr/include/c++/4.8"
      \ ]
let g:marching_enable_neocomplete = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)

""""""""""""""""""""
" Conf for rainbow "
""""""""""""""""""""
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan'],
    \   'operators': '_,_',
    \   'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
    \   'separately': {
    \       '*': {},
    \       'html': {},
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \           'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
    \       },
    \       'vim': {
    \           'parentheses': [['fu\w* \s*.*)','endfu\w*'], ['for','endfor'], ['while', 'endwhile'], ['if','_elseif\|else_','endif'], ['(',')'], ['\[','\]'], ['{','}']],
    \       },
    \       'tex': {
    \           'parentheses': [['(',')'], ['\[','\]'], ['\\begin{.*}','\\end{.*}']],
    \       },
    \       'css': 0,
    \       'stylus': 0,
    \   }
    \}

""""""""""""""""""""""
" Conf for syntastic "
""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['c', 'cpp'],
      \ 'passive_filetypes': ['puppet', 'html'] }
noremap <F9> <ESC>:SyntasticToggleMode<CR>
" let g:syntastic_c_config_file = '.syntastic_c_config'
let g:syntastic_c_checkers = ['gcc', 'cppcheck']
let g:syntastic_cpp_checkers = ['gcc', 'cppcheck']

"""""""""""""""""""""""""""""""""
" Conf for vim-colors-solarized "
"""""""""""""""""""""""""""""""""
let g:solarized_bold = 0
let g:solarized_contrast = "low"
"let g:solarized_termcolors = 256

if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

"""""""""""""""""""""""
" General vim settings "
"""""""""""""""""""""""

syntax on
set scrolloff=4

set modeline
set modelines=5

set hlsearch
set smartcase
set incsearch

set wildmenu
set wildmode=longest,list

set backspace=indent,eol,start
set autoindent
set cindent
set smartindent

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4
set softtabstop=4

set number
set novisualbell
set noerrorbells
set laststatus=2
set vb t_vb=
set ruler
set showcmd

" set cursorline
" set cursorcolumn
" highlight CurSorLine ctermbg=LightBlue
" highlight CursorColumn ctermbg=LightBlue
" set mouse=a

set undofile
set undodir=/usr/gcy/.vimundo

autocmd BufRead,BufNew *.md setlocal ft=markdown

autocmd BufReadPost *
      \ if line("'\"")>0&&line("'\"")<=line("$") |
      \	exe "normal g'\"" |
      \ endif
