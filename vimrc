set autoread
set lines=999 columns=9999
set guifont=Monaco:h14


let mapleader = ","
let g:mapleader = ","


set t_Co=256

 " colorscheme grb4
" colorscheme desert256
colorscheme ir_black

set encoding=utf8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

map j gj
map k gk
map 0 ^

map q bve

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


""Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction
















""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent

set nu

set tw=120

autocmd FileType markdown setlocal tw=80 formatoptions=tcmM

set formatoptions=tcmM

""""""""""""""""""""""""""""""

" autocmd FileType markdown colorscheme mac_classic

"""""""""""""""""""""""""""""""""""""""""
"
" ruby
"
"""""""""""""""""""""""""""""""""""""""""
set backspace=2
set smartindent
set mouse=a
set nowrapscan
set nocompatible
set list
set listchars=tab:\|\


"""""""""""""""""""""""""""""""""""""""""

"       CtrlP
"
""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = ',,'
let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_by_filename = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }

""""""""""""""""""""""""""""""""""""""""
"
"       auto-save
"
""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1

"""""""""""""""""""""""""""""""""""""""""
"
"       tComment
"
""""""""""""""""""""""""""""""""""""""""

  " Use Ctrl-c to comment and uncomment, cool
  map <c-c> gcc

"""""""""""""""""""""""""""""""""""""""""
"
"       rails.vim
"
""""""""""""""""""""""""""""""""""""""""
  " I don't use Rcontroller... stuff a lot
  " cause I have CtrlP, but rails.vim provide me `gf` for rails projects

""""""""""""""""""""""""""""""""""""""""
"
"       for Mac
"
""""""""""""""""""""""""""""""""""""""""

  " vim run in Mac terminal, does not have syntax highlighting without this
  syntax enable
  syntax on

""""""""""""""""""""""""""""""""""""""""
"
"       for markdown
"
""""""""""""""""""""""""""""""""""""""""

  " when you have .md file, default ft=modula2, thus wrong highlighting
  autocmd FileType modula2 set ft=


""""""""""""""""""""""""""""""""""""""""
"
"             pathogen
"
""""""""""""""""""""""""""""""""""""""""

  " doorkeeper of all my vim plugins
  call pathogen#infect()

""""""""""""""""""""""""""""""""""""""""
"
"             ack
"
""""""""""""""""""""""""""""""""""""""""

  " sudo apt-get install ack-grep, on ubuntu box
  map ,k :Ack <cword><ENTER>


""""""""""""""""""""""""""""""""""""""""
"
"             EOL whitespace
"
""""""""""""""""""""""""""""""""""""""""

  " now if you have spaces at end of lines, you get notified
  set list
  set listchars=trail:+


""""""""""""""""""""""""""""""""""""""""
"
"             paste
"
""""""""""""""""""""""""""""""""""""""""

  " for insert mode
  set pastetoggle=<f2>

""""""""""""""""""""""""""""""""""""""""
"
"             filetype
"
""""""""""""""""""""""""""""""""""""""""

  " Enable filetype plugin
  " for i_Ctrl-X_Ctrl-O
  filetype plugin on

""""""""""""""""""""""""""""""""""""""""
"
"             indent
"
""""""""""""""""""""""""""""""""""""""""

  " check :h filetype-indent-on
  " have proper indent level based on syntax
  " `=` also depends on this to work
  filetype indent on

  " if you use <tab> to indent the code
  " vim use tabs other than spaces for the indentaion
  " expandtab will turn a tab into 'tabstop' spaces
  set expandtab
  set tabstop=2


  " if you use '>' or <c-t> to indent the code, this matters
  " this default to 8
  set shiftwidth=2

  " you can also set different indent level for other languages
  "
  autocmd FileType c setlocal shiftwidth=4 tabstop=4

""""""""""""""""""""""""""""""""""""""""
"
"             buffers
"
""""""""""""""""""""""""""""""""""""""""

  set hidden "in order to switch between buffers with unsaved change 
  map <s-tab> :bp<cr>
  map <tab> :bn<cr>
  map ,bd :bd<cr>

""""""""""""""""""""""""""""""""""""""""
"
"     why I use *,* to do mapping?
"
""""""""""""""""""""""""""""""""""""""""

  " inspired by Derek, the reasons:
  " 1. <LEADER> is too long to type
  " 2. *,* is easier to reach than *\*
  " 3. in practice you nerver type in *,v*, but *, v*
  " Derek also do a nomap for *,*
  "   nnomap <c-e> ,
  " I do not do it, since I do not use *,* as a command a lot


""""""""""""""""""""""""""""""""""""""""
"
"             quit quickly
"
""""""""""""""""""""""""""""""""""""""""

  map ,f :q!<CR>

""""""""""""""""""""""""""""""""""""""""
"
"             vimrc editing
"
""""""""""""""""""""""""""""""""""""""""

  " I need a fake ~/.vimrc: runtime vimrc
  " http://www.derekwyatt.org/vim/the-vimrc-file/my-vimrc-file/
  map ,e :e ~/.vim/vimrc<CR>
  " When vimrc is edited, reload it
  " copied from http://amix.dk/vim/vimrc.html
  autocmd! bufwritepost vimrc source ~/.vim/vimrc


""""""""""""""""""""""""""""""""""""""""
"
"            quick escape
"
""""""""""""""""""""""""""""""""""""""""

  " set quick escape from insert mode, and now I can go without arrow keys and
  " use j and k to move around in insert mode
  imap jj <esc>

""""""""""""""""""""""""""""""""""""""""
"
"             wildmode
"
""""""""""""""""""""""""""""""""""""""""

  " use <C-D> with this to get a list
  set wildmenu

""""""""""""""""""""""""""""""""""""""""
"
"             dictionary
"
""""""""""""""""""""""""""""""""""""""

  " i_CTRL_X_K
  set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

""""""""""""""""""""""""""""""""""""""""
"
"             Search
"
""""""""""""""""""""""""""""""""""""""""

  " ic also has effect on dictionary settings
  set ic
  set hlsearch
  set incsearch

""""""""""""""""""""""""""""""""""""""""
"
"             status line
"
""""""""""""""""""""""""""""""""""""""""

  " Set the status line the way i like it
  set statusline=%F:\ %l\ %c


  " tell VIM to always put a status line in, even if there is only one window
  " this means I can also see what is the filename I am in, finally!
  set laststatus=2

""""""""""""""""""""""""""""""""""""""""
"
"             misc
"
""""""""""""""""""""""""""""""""""""""""

  " have nice $ sign when you use `cw`
  set cpoptions+=$

  " Do not know how to use autocmd yet, so the following line not working
  " autocmd FileType text setlocal textwidth=78
  " set textwidth=78


  " get rid of the silly characters in window separators
  set fillchars=""

  " hello-world is now one world
  set isk+=-

  " change cwd to current buffer
 nmap <silent> ,cd :lcd %:h<CR>



 """""""""""""""""""""""""""""""""""""""""
 " nerdtree "
 " autocmd vimenter * NERDTree
 autocmd vimenter * if !argc() | NERDTree | endif
 map <C-n> :NERDTreeToggle<CR>
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif




