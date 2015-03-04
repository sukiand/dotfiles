" Function Key
"   <F7>  -  Toggle nerdtree
"   <F8>  -  Toggle tagbar
"   <F9>  -  Toggle Syntastic
"   <F10> -  Toggle Paste Mode


" +----------------------+
" | Vundle configuration |
" +----------------------+

set nocompatible
filetype on 

runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
" " set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
"
" " Let Vundle manage Vundle
" Plugin 'gmarik/Vundle.vim'
"
" " Color scheme
" Plugin 'altercation/vim-colors-solarized'
"
" " Shougo series
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/neosnippet.vim'
" Plugin 'Shougo/neosnippet-snippets'
" Plugin 'Shougo/vimproc'
" Plugin 'Shougo/vimshell'
"
" " make comments
" Plugin 'tpope/vim-commentary'
"
" " toolbar
" Plugin 'scrooloose/nerdtree'
" Plugin 'majutsushi/tagbar'
"
" " Looking
" Plugin 'luochen1990/rainbow'
" Plugin 'tpope/vim-fugitive'
" Plugin 'itchyny/lightline.vim'
" Plugin 'Yggdroot/indentLine'
" Plugin 'ntpeters/vim-better-whitespace'
"
" " Encoding autodetect
" Plugin 'mbbill/fencview'
"
" " C,C++
" Plugin 'osyo-manga/vim-marching'
"
" " Doc
" Plugin 'DoxygenToolkit.vim'
"
" " formatting
" Plugin 'godlygeek/tabular'
"
" " Browsing code
" Plugin 'brookhong/cscope.vim'
"
" " syntax checking
" Plugin 'scrooloose/syntastic'
"
" " Fuzzy find
" Plugin 'yegappan/mru'
"
" " Tmux
" Plugin 'edkolev/tmuxline.vim'
"
" " surroundings
" Plugin 'tpope/vim-surround'
"
" " LaTeX
" Plugin 'LaTeX-Box-Team/LaTeX-Box'
"
" " HTML5
" Plugin 'mattn/emmet-vim'
"
" " editorconfig
" Plugin 'editorconfig/editorconfig-vim'
"
" " JSHint
" Plugin 'jshint.vim'
"
" " navigate
"
" call vundle#end()
filetype plugin indent on

" +----------------------+
" | Plugin Configuration |
" +----------------------+

" PLUGIN: neocomplete.vim
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
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
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

" PLUGIN: neosnippet.vim
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" PLUGIN: nerdtree
noremap <F7> <ESC>:NERDTreeToggle<CR>

" PLUGIN: rainbow
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

" PLUGIN: lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_function': {
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
function! MyReadonly()
  return &readonly ? '' : ''
endfunction

function! MyModified()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

" PLUGIN: tagbar
nnoremap <F8> <ESC>:Tagbar<CR>
autocmd FileType * nested :call tagbar#autoopen(0)
" autocmd VimEnter * nested :call tagbar#autoopen(1)
if has('gui_running')
  let g:tagbar_expand=1
endif
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : '/Users/zzy/Documents/Projects/go/bin/gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" PLUGIN: vim-marching
let g:marching_clang_command = "/usr/bin/clang"
let g:marching_include_paths = [
      \ "/usr/include/c++/4.2.1"
      \ ]
let g:marching_enable_neocomplete = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)

" PLUGIN: syntastic
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

" Plugin: tmuxline
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}

" " Plugin: LaTeX-Box
" let g:LatexBox_viewer = "open"
" let g:LatexBox_Folding = 1

" Plugin: emmet
let g:user_emmet_leader_key = '<C-e>'

" +-----------------------+
" | General Configuration |
" +-----------------------+

syntax on
" set autowrite
" set autoread
set pastetoggle=<F10>
set scrolloff=4
set completeopt=menu,preview,longest

" Modeline
set modeline
set modelines=5

" Backup
" set nowritebackup
" set nobackup

" Search
set hlsearch
set smartcase
set incsearch

" Command line
set wildmenu
set wildmode=longest,list

" Formatting
set backspace=indent,eol,start
set autoindent
set cindent
set smartindent

set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
autocmd FileType markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType make setlocal noexpandtab
autocmd FileType text setlocal textwidth=78 wrap spell
autocmd FileType tex setlocal spell
" autocmd FileType c,cpp,vim,go,sh,python,lisp setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Looking
set number
set relativenumber
set novisualbell
set noerrorbells
set laststatus=2
set vb t_vb=
set ruler
set showcmd
set background=light
colorscheme solarized
set cursorline

if has('gui_running')
  set guifont=Monaco\ for\ Powerline:h13
endif

" fold
set foldenable
set foldmethod=manual

" Mouse
if has('mouse')
  set mouse=a
endif
set mousehide

" window placement
set splitbelow
set splitright

autocmd BufReadPost *
			\ if line("'\"")>0&&line("'\"")<=line("$") |
			\	exe "normal g'\"" |
			\ endif
