set nocompatible
filetype off

" needed so that yank will yank to system clipboard (super nice)
set clipboard=unnamed

" Setting up Vundle - the vim plugin bundler
    let VundleWasInstalled=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let VundleWasInstalled=0
    endif

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'

    "" Add bundles here

    " leader + movement lets you jump across the file
    Bundle 'Lokaltog/vim-easymotion'
    " lots of autocomplete stuff
    if has('lua')
        Bundle 'Shougo/neocomplete.vim'
    else
        Bundle 'Shougo/neocomplcache.vim'
    endif
    " shows differences with git in the gutter
    Bundle 'airblade/vim-gitgutter'
    " adds mappings for movement by camelcase and underscores
    Bundle 'bkad/CamelCaseMotion'
    " nice statusline
    Bundle 'bling/vim-airline'
    " show buffers in statusline or command bar
    Bundle 'bling/vim-bufferline'
    " highlighting for scala
    Bundle 'derekwyatt/vim-scala'
    " github colorscheme
    Bundle 'endel/vim-github-colorscheme'
    " lets tab do autocomplete
    Bundle 'ervandew/supertab'
    " plugin to help aligning text
    Bundle 'godlygeek/tabular'
    " like ctrl+p in sublime, fuzzy file search
    Bundle 'kien/ctrlp.vim'
    " browse source code structure (uses ctags)
    Bundle 'majutsushi/tagbar'
    " nice dark layout
    Bundle 'quanganhdo/grb256'
    " syntax checking (shows up in gutter)
    Bundle 'scrooloose/syntastic'
    " great :substitute alternative, need to start using it
    Bundle 'tpope/vim-abolish'
    " better comment support (comment with gc)
    Bundle 'tpope/vim-commentary'
    " async compilation (key mappings below)
    Bundle 'tpope/vim-dispatch'
    " ends code structures (def ... end, if ... fi, etc)
    Bundle 'tpope/vim-endwise'
    " git integration
    Bundle 'tpope/vim-fugitive'
    " git file support
    Bundle 'tpope/vim-git'
    " markdown highlighting
    Bundle 'tpope/vim-markdown'
    " adds . repeat functionality to lots of other plugins
    Bundle 'tpope/vim-repeat'
    " sensible default settings
    Bundle 'tpope/vim-sensible'
    " lots of binds for wrapping chunks in delimiters
    Bundle 'tpope/vim-surround'
    " bracket [, ] mappings
    Bundle 'tpope/vim-unimpaired'
    " use :Scratch command to make a tmp buffer
    Bundle 'vim-scripts/scratch.vim'
    " soft-gamma dark colorscheme
    Bundle 'vim-scripts/xoria256.vim'
    " IRC client?
    Bundle 'vim-scripts/VimIRC.vim'

    if VundleWasInstalled == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end

" EasyMotion setting (the leader for easymotion is the normal leader)
let g:EasyMotion_leader_key = '<Leader>'

" set ttimeoutlen to support jj binding
if ! has('gui_running')
    set ttimeoutlen=10
endif

" escape insert mode with jj
inoremap jj <Esc>

" don't abandon buffers
set hidden

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
set number

" visual theme settings
set background=dark
colo xoria256
let g:airline_theme="dark"

" light mode settings
if($ITERM_PROFILE == "Lecture")
    set background=light
    colo github
    let g:airline_theme="light"
endif

" clears SignColumn (gutter) background
hi clear SignColumn

" set correct filetype when using fc tmpfiles
augroup bash_options
    autocmd!
    autocmd BufRead,BufNewFile bash-fc-* set filetype=sh
augroup END

