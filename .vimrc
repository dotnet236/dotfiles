"" =============================
"" Janus
"" =============================
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

" Pathogen
call janus#load_pathogen()


"" =============================
"" Vundle
"" =============================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on

"" Vundle Bundles
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
Bundle 'tpope/vim-unimpaired.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'othree/html5.vim.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'tComment'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar.git'
Bundle 'godlygeek/tabular.git'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'L9'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'camelcasemotion'
Bundle 'ShowMarks'


"" =============================
"" Key Remaps
"" =============================

" Zoom In/Out
nnoremap t <C-]>
map + <c-w>+
map - <c-w>-
map <c-l> 10<c-w>>

" Pane Movement
map <c-w>u <c-w>t<c-w>K
map <c-w>d <c-w>t<c-w>H

"" Move Between Words Using Camel Case
map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b
map e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"" Copy/Paste
nmap <c-p> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR><Esc>
imap <c-p> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR><Esc>
nmap <c-y> :.w !pbcopy<CR><CR>
vmap <c-y> :w !pbcopy<CR><CR>

"" Clear pattern match with space
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" JSON Formatter
map <Leader>jf  <Esc>:%!json_xs -f json -t json-pretty<CR>

"" Spell Checking
nmap <silent> s :set spell!<CR>

"" Toggle To/From Test
nmap <c-a> :call ToggleBetweenTest()<CR>

"" Run RSpec
map <c-o> :call RunCurrentSpecFile()<CR>
map <c-i> :call RunNearestSpec()<CR>

"" Git
nmap <Leader>o :only!<CR>:diffoff<CR>
nmap <Leader>g :Gstatus<CR>

"" View KeyMaps
map <c-m> :e ~/.vimrc<CR>:115<CR><ESC>

"" Navigate Buffers
map <c-h> :bn<CR>
map <c-l> :bp<CR>

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
"" Cursor Remaps
"" ============================
"" HIGHLIGHT ACTIVE LINE AND COLUMN
hi CursorLine cterm=NONE ctermbg=White ctermfg=Black guibg=White guifg=Black
hi CursorColumn cterm=NONE ctermbg=White ctermfg=Black guibg=White guifg=Black
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
"" File Transitions
"" ============================
"" Functional Test <-> Controller - Props to J. Weirich for the idea
function! ToggleBetweenTest()
  let in_test_file = match(expand("%"), '\(_spec.rb\)$') != -1
  if in_test_file
    let tmp_path = substitute(expand('%:p'), 'spec/requests', 'app/controllers', '')
    let controller_path = substitute(tmp_path, 'resource_spec.rb', 'controller.rb', '')
    execute ":e " . controller_path
  else
    let tmp_path = substitute(expand('%:p'), 'app/controllers', 'spec/requests', '')
    let spec_path = substitute(tmp_path, 'controller.rb', 'resource_spec.rb', '')
    execute ":e " . spec_path
  endif
endfunction


"" ============================
"" Rspec w/zeus - Thanks B. Orenstein
"" ============================
function! RunCurrentSpecFile()
  if InSpecFile()
    let l:command = "s " . @% . " -f documentation"
    call SetLastSpecCommand(l:command)
    call RunSpecs(l:command)
  endif
endfunction

function! RunNearestSpec()
  if InSpecFile()
    let l:command = "s " . @% . " -l " . line(".") . " -f documentation"
    call SetLastSpecCommand(l:command)
    call RunSpecs(l:command)
  endif
endfunction

function! RunLastSpec()
  if exists("t:last_spec_command")
    call RunSpecs(t:last_spec_command)
  endif
endfunction

function! InSpecFile()
  return match(expand("%"), "_spec.rb$") != -1
endfunction

function! SetLastSpecCommand(command)
  let t:last_spec_command = a:command
endfunction
 

function! RunSpecs(command)
  execute ":w\|!clear && echo " . a:command . " && echo && " . a:command
endfunction


"" ============================
"" .vimrc
"" ============================
"" Reload .vimrc when saved
autocmd BufWritePost .vimrc source %
