""
"" Janus setup
""
let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
let g:janus_custom_path = expand("~/.janus")

exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

call janus#load_pathogen()


""
"" Vundle Setup
""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on


""
"" Vundle Bundles
""
Bundle 'gmarik/vundle'
Bundle 'greplace.vim'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-cucumber.git'
Bundle 'tpope/vim-bundler.git'
Bundle 'tpope/vim-git.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-rake.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'othree/html5.vim.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'tComment'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar.git'
Bundle 'godlygeek/tabular.git'
Bundle 'lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'l9'
Bundle 'fuzzyfinder'
Bundle 'git://git.wincent.com/command-t.git'

""
"" Key Remaps
""
nnoremap t <C-]>


""
"" Cursor Remaps
""
" HIGHLIGHT ACTIVE LINE AND COLUMN
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
