"" =============================
"" Vundle
"" =============================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

filetype plugin indent on

"" Vundle Bundles

Plugin 'VundleVim/Vundle.vim'

Plugin 'gitignore'
Plugin 'vim-expand-region'
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-git.git'
Plugin 'tpope/vim-rake.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'othree/html5.vim.git'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'tComment'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular.git'
Plugin 'https://github.com/airblade/vim-gitgutter.git'
Plugin 'https://github.com/jceb/vim-orgmode.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'https://github.com/tpope/vim-markdown.git'
Plugin 'rking/ag.vim'
Plugin 'https://github.com/suan/vim-instant-markdown'
Plugin 'https://github.com/jeffkreeftmeijer/vim-numbertoggle'
Plugin 'skalnik/vim-vroom'
Plugin 'benmills/vimux'
Plugin 'bkad/camelcasemotion'
Plugin 'wincent/Command-T'
Plugin 'bling/vim-airline'

call vundle#end()  
filetype plugin indent on

"" =============================
"" Colors
"" =============================
syntax enable
set background=dark

"" =============================
"" Key Remaps
"" =============================

nnoremap <silent> <c-p> <Plug>(CommandT)

" Pane Movement
map <c-w>u <c-w>t<c-w>K
map <c-w>d <c-w>t<c-w>H

"" Copy/Paste
"" nmap <c-p> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR><Esc>
"" imap <c-p> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR><Esc>
nmap <c-y> :.w !pbcopy<CR><CR>
vmap <c-y> :w !pbcopy<CR><CR>

"" Run RSpec
map <c-o> :call RunCurrentTest()<CR>
map <c-i> :call RunCurrentLineInTest()<CR>

""RunCurrentLineInTest()<CR>

"" Edit 'general' scratch pad
map <c-n> :e ~/Notes/current_notes<CR><ESC>

"" Maximize split
nmap <c-b> :call ZoomWin()<CR><ESC>
"" Clear pattern match with space

"" View KeyMaps
map <c-m> :e ~/.vimrc<CR>:115<CR><ESC>

"" Toggle To/From Test
nmap <c-a> :call ToggleBetweenTest() <CR><ESC>

"" Git
nmap <Leader>o :only!<CR>:diffoff<CR>
nmap <Leader>g :Gstatus<CR>

"" Relative Line Number Toggling
let g:NumberToggleTrigger="<Leader>-"

" JSON Formatter
map <Leader>jf :!python -m json.tool<CR>
""<Esc>:%!json_xs -f json -t json-pretty<CR>

"" Disable selection highlighting
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"" Spell Checking
nmap <silent> s :set spell!<CR>

"" Nerd Tree
nmap <Leader>d :NERDTree<CR><ESC>
  - "app/**/*.{js,coffee}"
  - "app/assets/javascripts/test.js.coffee"

"" Preview Markdown File
"" map <Leader>m :MarkedOpen<CR><ESC>

nnoremap <S-f> :Ag!

""Disard File Changes
map <Leader>d :Git checkout -- %<CR><ESC>

""Redraw...yep this is a hack
""TODO: Figure out why redrawing is sometimes necessary
map <Leader>r :!resize<CR><ESC>

"" Region Expanding
"" Credit to http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

""Navigate to URL under cursor
map gl :call OpenURI()<CR><ESC>

""Always save when hitting Escape
""map <Esc> :w<CR>

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"
set wildignore+=*/public,*/node_modules,*/bower_components,*/tmp/*,*.so,*.swp,*.zip

"" Do not clear buffer after pasting
vmap <silent> <expr> p <sid>Repl()

"" =============================
"" Markdown
"" =============================
map <c-\> :!greadme expand('%:p')

"" =============================
"" File Exclusions
"" =============================
set wildignore+="**/.jhw-cache/**"

"" ============================
"" Swap File
"" ============================
set noswapfile

"" =============================
"" Mouse Features
"" =============================
set mouse=nv

"" ============================
"" Code Folding
"" ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"" ============================
"" Cache files in CTRLP using git ls-files
"" ============================
set foldmethod=indent   "fold based on indent
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

"" ============================
"" Configuration for vroommmmmmmmm
"" ============================
let g:vroom_write_all = 1
let g:vroom_use_vimux = 1
let g:vroom_use_spring = 1
let g:vroom_detect_spec_helper = 1


"" ============================
"" CoffeeScript
"" ============================
let coffee_compiler = '/usr/local/share/npm/bin/coffee'
let coffee_compile_vert = 1


"" Powerline
"" let g:Powerline_symbols='Fancy'

"" ============================
"" Cursor Remaps
"" ============================
"" HIGHLIGHT ACTIVE LINE AND COLUMN
hi CursorColumn cterm=NONE ctermbg=White ctermfg=Black guibg=White guifg=Black
hi CursorLine cterm=NONE ctermbg=White ctermfg=Black guibg=White guifg=Black
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
set cursorline cursorcolumn


"" ============================
"" On File Load Events
"" ============================
"" Higlight Matching Parens
au VimEnter * DoMatchParen

"" Change current working directory when a file is opended
set autochdir


"" ============================
"" Sounds
"" ============================
""Disable beeping
set vb



"" ============================
"" File Transitions
"" ============================
"" Functional Test <-> Controller - Props to J. Weirich for the idea
function! ToggleBetweenTest()
  let in_test_file = match(expand("%"), '\(_spec.rb\)$') != -1
  if in_test_file
    let tmp_path = substitute(expand('%:p'), 'spec/controllers', 'app/controllers', '')
    let controller_path = substitute(tmp_path, '_spec.rb', '.rb', '')
    execute ":e " . controller_path
  else
    let tmp_path = substitute(expand('%:p'), 'app/controllers', 'spec/controllers', '')
    let spec_path = substitute(tmp_path, '.rb', '_spec.rb', '')
    execute ":e " . spec_path
  endif
endfunction


"" ============================
"" Rspec w/spring - Thanks B. Orenstein
"" ============================
function! RunCurrentTest()
  let g:spec_directory = expand('%:p:h')
  let g:in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1

  if g:in_test_file
    call SetTestFile()
    call ChangeDirectory(b:rails_root)
    call SetTestRunner("!spring rspec --format doc ")
    exec g:bjo_test_runner g:bjo_test_file
    call ChangeDirectory(g:spec_directory)
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let g:spec_directory = expand('%:p:h')
  let g:in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if g:in_test_file
    call SetTestFileWithLine()
    call ChangeDirectory(b:rails_root)
    let g:cmd = "!FULL=1 spring rspec --format doc " . g:bjo_test_file . ":" . g:bjo_test_file_line
    echo g:cmd
    exec g:cmd
    call ChangeDirectory(g:spec_directory)
  end
endfunction

function! SetTestFile()
  let g:bjo_test_file=expand('%:p')
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=expand('%:p')
  let g:bjo_test_file_line=line(".")
endfunction

function! ChangeDirectory(directory)
  exec "cd " . a:directory
endfunction

function! OpenURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction

"" ============================
"" Markdown Preview
"" ============================
filetype plugin on

"" ============================
"" .vimrc
"" ============================
"" Reload .vimrc when saved
"" autocmd  BufWritePost .vimrc source %

""
"" ============================
"" Restore Paste Buffer
"" ============================
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

"" =============================
"" Relative Line Numbers
"" =============================
set relativenumber

set tabstop=2
