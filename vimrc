set nocompatible
filetype off

" needed so that yank will yank to system clipboard (super nice)
set clipboard=unnamed

" Setting up Vundle - the vim plugin bundler
    let VundleWasInstalled=1
    if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
        !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        let VundleWasInstalled=0
    endif

    set runtimepath+=~/.vim/bundle/Vundle.vim

    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'

    "" Add bundles here

    " leader + movement lets you jump across the file
    " Plugin 'Lokaltog/vim-easymotion'
    " lots of autocomplete stuff
    Plugin 'Shougo/neocomplete.vim'
    Plugin 'Shougo/neocomplcache.vim'
    " shows differences with git in the gutter
    Plugin 'airblade/vim-gitgutter'
    " adds mappings for movement by camelcase and underscores
    Plugin 'bkad/CamelCaseMotion'
    " nice statusline
    Plugin 'bling/vim-airline'
    " show buffers in statusline or command bar
    Plugin 'bling/vim-bufferline'
    " highlighting for scala
    Plugin 'derekwyatt/vim-scala'
    " lets tab do autocomplete
    Plugin 'ervandew/supertab'
    " plugin to help aligning text
    Plugin 'godlygeek/tabular'
    " like ctrl+p in sublime, fuzzy file search
    Plugin 'kien/ctrlp.vim'
    " browse source code structure (uses ctags)
    Plugin 'majutsushi/tagbar'
    " run ag from vim and shows up in split pane
    Plugin 'rking/ag.vim'
    " syntax checking (shows up in gutter and statusline)
    Plugin 'scrooloose/syntastic'
    " great :substitute alternative, need to start using it
    Plugin 'tpope/vim-abolish'
    " better comment support (comment with gc)
    Plugin 'tpope/vim-commentary'
    " async compilation (key mappings below)
    Plugin 'tpope/vim-dispatch'
    " ends code structures (def ... end, if ... fi, etc)
    Plugin 'tpope/vim-endwise'
    " git integration
    Plugin 'tpope/vim-fugitive'
    " git file support
    Plugin 'tpope/vim-git'
    " markdown highlighting
    Plugin 'tpope/vim-markdown'
    " rails support
    Plugin 'tpope/vim-rails'
    " adds . repeat functionality to lots of other plugins
    Plugin 'tpope/vim-repeat'
    " sensible default settings
    Plugin 'tpope/vim-sensible'
    " lots of binds for wrapping chunks in delimiters
    Plugin 'tpope/vim-surround'
    " bracket [, ] mappings
    Plugin 'tpope/vim-unimpaired'
    " vim-latex suite
    Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'

    " colorschemes
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'endel/vim-github-colorscheme'
    Plugin 'quanganhdo/grb256'
    Plugin 'vim-scripts/xoria256.vim'

    call vundle#end()

    if VundleWasInstalled == 0
        :PluginInstall
    endif
" Setting up Vundle - the vim plugin bundler end

" EasyMotion setting (the leader for easymotion is the normal leader)
" let g:EasyMotion_leader_key = '<Leader>'

" set ttimeoutlen to support jj binding
if ! has('gui_running')
    set ttimeoutlen=10
endif

" font for airline
set guifont=Source\ Code\ Pro\ for\ Powerline:h12

" escape insert mode with jj
inoremap jj <Esc>

" don't abandon buffers
set hidden

" Set syntastic to use pylintrc (why would it need this? lame)
" let g:syntastic_python_pylint_args = '--rcfile=/Users/blkbsstt/.pylintrc'
let g:syntastic_python_pylint_args = '--disable=invalid-name,missing-docstring'

" start neocomplete
if has('lua')
    let g:neocomplete#enable_at_startup = 1
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
else
    let g:neocomplcache_enable_at_startup = 1
    if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
endif

" <CR>: close popup and open a new line.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    if has('lua')
        return neocomplete#smart_close_popup() . "\<CR>"
    else
        return neocomplcache#smart_close_popup() . "\<CR>"
    endif
endfunction

augroup NEOCOMPLETE
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END


"" Tagbar settings
    nnoremap <silent> <F8> :TagbarToggle<CR>
    let g:tagbar_autoclose = 1
    let g:tagbar_compact   = 1
    let g:tagbar_iconchars = ['▸', '▾']
"" End Tagbar settings

" settings for latex
let g:tex_flavor = 'latex'
augroup TEX_OPTIONS
    autocmd!
    autocmd FileType tex set spell
    autocmd FileType tex let b:dispatch = "pdflatex %"
augroup END

nnoremap <F9> :Dispatch!<CR>
nnoremap <S-F9> :Dispatch<CR>

" setting format options (see :h formatoptions)
" most deal with wrapping of lines and comments
" 'r' sets automatically starting line after comment with comment leader
set formatoptions=tcqr

"" Begin airline settings
    " V comment this line if using unpatched fonts V
    if empty($ISSH)
        let g:airline_powerline_fonts = 1
    endif

    " enable bufferline compatibility
    let g:airline#extensions#bufferline#overwrite_variables = 1

    " 256 terminal colors
    set t_Co=256

    " hides mode (INS, VIS, etc), allowing powerline to do it instead
    set noshowmode

    " UTF-8 encoding
    set encoding=utf-8
"" End airline settings

" don't put buffers on command bar
let g:bufferline_echo = 0

" camelcasemotion mapping overrides

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" show special characters
set list

" Smart indent
set si

" Wrap lines at window boundary
set wrap

" persistent undo settings (allowing undo between file close / reopen)
if has('persistent_undo')
    let undodirectory=expand('~/.vim/undo')
    if ! isdirectory(undodirectory)
        :silent !mkdir -p ~/.vim/undo >/dev/null 2>&1
    endif
    set undodir=~/.vim/undo
    set undofile
    set undoreload=10000
endif

set undolevels=1000

" setup swap directory
if isdirectory($HOME . '/.vim/swp') == 0
    :silent !mkdir -p ~/.vim/swp >/dev/null 2>&1
endif

set dir=~/.vim/swp//

" setup backupdir
if isdirectory($HOME . '/.vim/backup') == 0
    :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif

" move current dir (.) to end of list
set backupdir-=.
set backupdir+=.

" put backupdir at start of list
set backupdir^=~/.vim/backup/
set backup

syntax on

" Fixing some issues with F-keys
set <F1>=OP
set <F2>=OQ
set <F3>=OR
set <F4>=OS
set <F5>=[15~
set <F6>=[17~
set <F7>=[18~
set <F8>=[19~
set <F9>=[20~
set <F10>=[21~
set <F19>=[18;2~

" No cheating with arrow keys in insert or normal mode!
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

" Wildmenu (autocomplete) settings
set wildmode=list:longest,full

" ttym type
set ttym=xterm2

" mouse support
set mouse=a

" show line numbers
set relativenumber
set number
set cursorline
set colorcolumn=80

" dark mode settings
set background=dark
colo solarized
let g:airline_theme="solarized"

if ($ITERM_PROFILE == "Light")
    set background=light
    colo solarized
    let g:airline_theme="solarized"
endif

" clears SignColumn (gutter) background
hi clear SignColumn

" set correct filetype when using fc tmpfiles
augroup bash_options
    autocmd!
    autocmd BufRead,BufNewFile bash-fc-* set filetype=sh
augroup END

