set nocompatible
filetype off

" needed so that yank will yank to system clipboard (super nice)
set clipboard=unnamed

" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    "Add your bundles here
    Bundle 'derekwyatt/vim-scala'
    Bundle 'tpope/vim-sensible'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-speeddating'
    Bundle 'tpope/vim-abolish'
    Bundle 'tpope/vim-endwise'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'tpope/vim-commentary'
    Bundle 'tpope/vim-sensible'
    Bundle 'tpope/vim-git'
    Bundle 'tpope/vim-markdown'
    Bundle 'tpope/vim-dispatch'
    Bundle 'endel/vim-github-colorscheme'
    Bundle 'kien/ctrlp.vim'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'jeetsukumaran/vim-buffergator'
    Bundle 'scrooloose/syntastic'
    Bundle 'airblade/vim-gitgutter'
    Bundle 'ervandew/supertab'
    Bundle 'quanganhdo/grb256'
    Bundle 'vim-scripts/maude.vim'
    "...All your other bundles...
    if iCanHazVundle == 0
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

" settings for latex
let g:tex_flavor = 'latex'
augroup TEX_OPTIONS
    autocmd!
    autocmd FileType tex set spell
    autocmd FileType tex let b:dispatch = 'pdflatex %'
augroup END

nnoremap <F9> :Dispatch<CR>

" setting format options (see :h formatoptions)
" most deal with wrapping of lines and comments
" r sets automatically starting line after comment with comment leader
set formatoptions=tcqr

"" Powerline settings
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

" 256 terminal colors
set t_Co=256

" always show full statusbar
set laststatus=2

" hides mode (INS, VIS, etc), allowing powerline to do it instead
set noshowmode

" UTF-8 encoding
set encoding=utf-8

let g:Powerline_symbols='unicode'
"" End Powerline settings

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
    set undodir=~/.vim/undo
    set undofile
    set undoreload=10000
endif
set undolevels=1000

" setup swap directory
if ifdirectory($HOME . '/.vim/swp') == 0
    :silent !mkdir -p ~/.vim/swp >/dev/null 2>&1
endif

set dir=~/.vim/swp//

" setup backupdir
if ifdirectory($HOME . '/.vim/backup') == 0
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
set wildmenu
set wildmode=list:longest,full

" ttym type
set ttym=xterm2

" mouse support
set mouse=a

" show line numbers
set number

" visual theme settings
set background=dark
colo grb256

" light mode settings
if($ITERM_PROFILE == "Lecture")
    set background=light
    colo github
endif

" set correct filetype when using fc tmpfiles
augroup bash_options
    autocmd!
    autocmd BufRead,BufNewFile bash-fc-* set filetype=sh
augroup END

