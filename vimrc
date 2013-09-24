set nocompatible
filetype off

set clipboard=unnamed

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

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

let g:EasyMotion_leader_key = '<Leader>'

if ! has('gui_running')
    set ttimeoutlen=10
endif

let g:tex_flavor = 'latex'
autocmd FileType tex set spell
autocmd FileType tex let b:dispatch = 'pdflatex %'

nnoremap <F9> :Dispatch<CR>

set formatoptions=tcqr

set t_Co=256
set laststatus=2
set noshowmode
set encoding=utf-8
let g:Powerline_symbols='unicode'

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set list

set si "Smart indent
set wrap "Wrap lines

set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

set dir=~/.vim/swp
set backupdir=~/.vim/backup

syntax on

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

inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

set wildmenu
set wildmode=list:longest,full
set ttym=xterm2
set mouse=a
set number

set background=dark
colo grb256

if($ITERM_PROFILE == "Lecture")
    set background=light
    colo github
endif

au BufRead,BufNewFile bash-fc-* set filetype=sh

inoremap jj <Esc>
