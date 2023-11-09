set nocompatible

syntax on
syntax enable

filetype on
filetype plugin indent on
set linespace=10

let mapleader=','

hi Visual  guifg=#000000 guibg=#FFFFFF gui=none

" ================ General Config ====================

scriptencoding utf-8            "utf-8 all the way
set encoding=utf-8
set number                      "Line numbers are good
set splitbelow
set splitright
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set mouse=a                     "Disable mouse click
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set cursorline                  "Set line on cursor
set cursorcolumn                "Set column on cursor
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set guifont=Inconsolata\ XL:h14,Inconsolata:h15,Monaco:17,Monospace
setl nu
set clipboard=unnamed
set nomodeline

"disable macro recording
map q <Nop>

" Copy and paste clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

"" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" better tabbing
vnoremap < <gv
vnoremap > >gv

nnoremap <ALT-j> :resize -2<CR>
nnoremap <ALT-k> :resize +2<CR>
nnoremap <ALT-h> :vertical resize -2<CR>
nnoremap <ALT-l> :vertical resize +2<CR>

autocmd BufWritePre * %s/\s\+$//e

" Disable mouse scroll wheel
:nmap <ScrollWheelUp> <nop>
:nmap <S-ScrollWheelUp> <nop>
:nmap <C-ScrollWheelUp> <nop>
:nmap <ScrollWheelDown> <nop>
:nmap <S-ScrollWheelDown> <nop>
:nmap <C-ScrollWheelDown> <nop>
:nmap <ScrollWheelLeft> <nop>
:nmap <S-ScrollWheelLeft> <nop>
:nmap <C-ScrollWheelLeft> <nop>
:nmap <ScrollWheelRight> <nop>
:nmap <S-ScrollWheelRight> <nop>
:nmap <C-ScrollWheelRight> <nop>

" Open Files
map <space>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <space>t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <space>v :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <space>s :split <C-R>=expand("%:p:h") . "/" <CR>
map <space>r :r <C-R>=expand("%:p:h") . "/" <CR>

if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

  set grepprg=rg\ --vimgrep

  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

  " Rg current worda
  nnoremap <leader>fw :Rg <C-R><C-W><space> <CR>

  " Rg
  nnoremap \ :Rg <C-R><space>
endif

" nerd tree
nmap <silent> <C-a> :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeFocus"
  else
    if @% == ""
      exe ":NERDTreeToggle"
    else
      exe ":NERDTreeFind"
    endif ""
  endif
endfunction

let g:multi_cursor_quit_key = '<C-m>'
let g:NERDTreeQuitOnOpen = 1
 "NerdTree show dotfiles config
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"

let g:NERDTreeWinSize=100

 "NerdTree show line numbers
let NERDTreeShowLineNumbers=1

 "NerdTree git statuses icons
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'🦄',
                \ 'Staged'    :'➕',
                \ 'Untracked' :'⭐️',
                \ 'Renamed'   :'🔜',
                \ 'Unmerged'  :'🐣',
                \ 'Deleted'   :'❌',
                \ 'Dirty'     :'🤓',
                \ 'Ignored'   :'🙋',
                \ 'Clean'     :'✅',
                \ 'Unknown'   :'❓',
                \ }

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

set viminfo+=! " make sure vim history works
set wmh=0 " reduces splits to a single line

" Always show status line
set laststatus=2
" Respect modeline in files
"set modeline
set modelines=4
" Disable error bells
set noerrorbells

set cmdheight=2
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set title

" FZF
let g:fzf_layout = { 'down': '40%' }
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

"let g:VimTodoListsUndoneItem = '- []'
"let g:VimTodoListsDoneItem = '- [V]'
\
" Ack config
cnoreabbrev Ack Ack!

"nmap <silent> <leader>f :Ack!<CR>
"nnoremap <Leader>a :vsp<CR> :Ack!<Space>

" Tab navigation
noremap <Tab> :tabnext<CR>
noremap <S-Tab> :tabprevious<CR>

nnoremap tn :tabnew<CR>
"nnoremap tk :tabfirst<CR>
"nnoremap <leader>d :tabnext<CR>
"nnoremap <leader>a :tabprev<CR>
"nnoremap tj :tablast<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Move to previous/next
nnoremap <silent>    <leader>a <Cmd>BufferPrevious<CR>
nnoremap <silent>    <leader>d <Cmd>BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>

" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButVisible
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight

" Magic buffer-picking mode
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
nnoremap <silent> <C-p>    <Cmd>BufferPickDelete<CR>

" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

" Close Barbar tab plugin with :q
"function! CloseBarbarWithQ()
    "" If there are more tabs, switch to the next one
    "silent! BufferClose
  "" Close the current tab
  "silent! :q
"endfunction

""" Map :q to close Barbar tab plugin
""nnoremap <silent> <leader>q :call CloseBarbarWithQ()<CR>
"cnoremap q :call CloseBarbarWithQ()<CR>

let g:vem_tabline_show_icon = 1

nnoremap term :vsp term://zsh<CR>

" Copy clipboard commands
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
vmap <C-v> :!pbpaste<CR>

" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cf :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cF :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>ct :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
endif

set autoindent
set smartindent
"set smarttab
set shiftwidth=2
"set softtabstop=2
"set tabstop=2
"set expandtab

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
nnoremap <leader><space> :nohlsearch<CR>

" ===================================================

" Navigation in splits tabs
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"imap <silent> <C-j> <Plug>(copilot-next)
"imap <silent> <C-k> <Plug>(copilot-previous)
"imap <silent> <C-\> <Plug>(copilot-dismiss)

" Display tabs and trailing spaces visually
set list
set listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Toggle copen / close
function! QuickFix_toggle()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor

  copen
endfunction

nnoremap <C-t> :call QuickFix_toggle()<cr>

nnoremap <Leader>b  :e#<CR>

call plug#begin('~/.vim/plugged')
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'w0ng/vim-hybrid'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'

  Plug 'ap/vim-css-color'

  Plug 'tpope/vim-surround'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-eunuch'
  "Plug 'vim-nerdtree-syntax-highlight'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'vim-test/vim-test'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'etdev/vim-hexcolor'

  "Plug 'blueyed/vim-diminactive'
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'

  Plug 'aserebryakov/vim-todo-lists'
  Plug 'tomswartz07/vim-todo'

  Plug 'CoderCookE/vim-chatgpt'

  Plug 'fabi1cazenave/termopen.vim'

  Plug 'kassio/neoterm'
  " Remove blamer becase visual bugs
  "Plug 'APZelos/blamer.nvim'
  Plug 'zivyangll/git-blame.vim'

  Plug 'severin-lemaignan/vim-minimap'

  Plug 'mhinz/vim-startify'

  Plug 'nvim-tree/nvim-web-devicons'
  "Plug 'romgrk/barbar.nvim'
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'qpkorr/vim-bufkill'
  "Plug 'pacha/vem-tabline'

  "Plug 'itchyny/lightline.vim'

  " Code speel
  Plug 'iamcco/coc-spell-checker'

  Plug 'terryma/vim-multiple-cursors'

  " AI
  "Plug 'github/copilot.vim'

  " Code scopes
  Plug 'wordijp/vim-vimscript-scope-syntax'
  Plug 'radgeRayden/vim-scopes'
  Plug 'nathanaelkane/vim-indent-guides'

  " Vim svelte
  Plug 'evanleck/vim-svelte'

  " Ack needed install Ack on Mac via brew
  Plug 'mileszs/ack.vim'

  Plug 'airblade/vim-gitgutter'

  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

  " Flutter
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'natebosch/vim-lsc'
  Plug 'natebosch/vim-lsc-dart'

" Flutter
  Plug 'thosakwe/vim-flutter'
  " Vim commands for Flutter, including hot-reload-on-save and more.
  Plug 'natebosch/vim-lsc-dart'

  " FrontEnd
  Plug 'pangloss/vim-javascript'    " JavaScript support
  Plug 'leafgarland/typescript-vim' " TypeScript syntax
  Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
  Plug 'jparise/vim-graphql'        " GraphQL syntax

  "Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'SirVer/ultisnips'

  " Rust
  Plug 'rust-lang/rust.vim'
  Plug 'neoclide/coc-rls'

  " Elixir
  Plug 'elixir-editors/vim-elixir' " Syntax highlighting, Filetype detection, Automatic indentation
  Plug 'mhinz/vim-mix-format' " Run mix formatter asynchronously (:MixFormat, :verb MixFormat, :MixFormatDiff)
  Plug 'slashmili/alchemist.vim' " Completion for Modules and functions, and much more...
  Plug 'neomake/neomake' " Execute code checks to find mistakes in the currently edited file
  Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

  Plug 'mhanberg/elixir.nvim'

  " NerdTree fonts
  Plug 'ryanoasis/vim-devicons'

  " NerdTree Git icons
  Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

  " Vim theme color
  Plug 'ayu-theme/ayu-vim'
call plug#end()

"let g:airline_statusline_ontop=1
"let g:airline#extensions#tabline#enabled = 1


let g:chat_gpt_max_tokens=2000
let g:chat_gpt_model='gpt-3.5-turbo'
let g:chat_gpt_session_mode=1
let g:chat_gpt_temperature = 0.7
let g:chat_gpt_lang = 'English'

" Lightline color schema
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

let g:dbs = {
\  'trader': 'postgresql://postgres@localhost/trader_dev'
\ }

let g:db_ui_table_helpers = {
\   'postgresql': {
\     'Count': 'select count(*) from "{table}"'
\   }
\ }

let g:db_ui_table_helpers = {
\   'postgresql': {
\     'List': 'select * from "{table}" order by id asc'
\   }
\ }

let g:db_ui_auto_execute_table_helpers = 1


" Nerd Commenter jsx files
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}
"hi StartifyHeader  ctermfg=114
let g:startify_custom_header = [
  \'                   .mmMMMMMMMMMMMMMmm.                   João Antonio Maruti Milagres                  ',
  \'               .mMMMMMMMMMMMMMMMMMMMMMMMm.               ----------------------------------------------',
  \'            .mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm.            GitHub: https://github.com/joaoantoniomaruti  ',
  \'          .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.          Linkedin: https://linkedin.com/in/joaomilagres',
  \'        .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.        Email: joaoantoniomaruti@gmail.com            ',
  \'       MMMMMMMM:  ``MMMMM````````MMMM``` :MMMMMMMM       Twitch: https://twitch.tv/joaoantoniomaruti   ',
  \'      MMMMMMMMM                           MMMMMMMMM                                                    ',
  \'     MMMMMMMMMM:                         :MMMMMMMMMM     Hard Skills                                   ',
  \'    .MMMMMMMMMM                           MMMMMMMMMM.    - Elixir                                      ',
  \'    MMMMMMMMM"                             "MMMMMMMMM    - Phoenix Framework                           ',
  \'    MMMMMMMMM                               MMMMMMMMM    - Javascript and TypeScript                   ',
  \'    MMMMMMMMM                               MMMMMMMMM    - React                                       ',
  \'    MMMMMMMMMM                             MMMMMMMMMM    - GraphQL                                     ',
  \'    `MMMMMMMMMM                           MMMMMMMMMM`                                                  ',
  \'     MMMMMMMMMMMM.                     .MMMMMMMMMMMM                                                   ',
  \'      MMMMMM  MMMMMMMMMM         MMMMMMMMMMMMMMMMMM                                                    ',
  \'       MMMMMM   MMMMMMM           MMMMMMMMMMMMMMMM                                                     ',
  \'        `MMMMMM  "MMMMM           MMMMMMMMMMMMMM`                                                      ',
  \'          `MMMMMm                 MMMMMMMMMMMM`                                                        ',
  \'            `"MMMMMMMMM           MMMMMMMMM"`                                                          ',
  \'               `"MMMMMM           MMMMMM"`                                                             ',
  \'                   `""M           M""`                   Website: https://joaoantoniomaruti.com.br     ',
\]

"g:lightline#bufferline#enable_devicons

"autocmd VimEnter, Colorscheme * :hi StartifyHeader ctermfg=91 ctermbg=1

" Rainbow tabs
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#170428   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#200a34 ctermbg=4

" Vim minimap config
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'
let g:minimap_highlight='Visual'

" COC
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gs :sp<CR><Plug>(coc-definition)
nmap <silent> gv :vsp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nmap <leader>db :DBUIToggle<CR>

" Javascript
let g:hybrid_custom_term_colors = 0
let g:hybrid_reduced_contrast = 0
set background=dark
"colorscheme hybrid

" FZF
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

"FZF Buffer Delete

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))


if has('nvim')
  tmap <C-o> <C-\> <C-n>
endif

let test#strategy = "neovim"
"let test#ruby#rspec#executable = 'bundle exec rspec'
"let test#ruby#rspec#options = '--format documentation'
let g:test#neovim#term_position = 'vert'
let g:test#neovim#start_normal = 1
" vim-tests bindings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
"nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

nmap <silent> <leader>sp :vsp<CR>
nmap <silent> <leader>vs :vsp<CR>
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader>wq :wq<CR>
nmap <silent> <leader>w :w<CR>
nmap <silent> <leader>ct :bd<CR>
nmap <silent> <leader>sp :sp<CR>
nmap <silent> <leader>vsp :vsp<CR>

" neovim config
  " change cursor to bar in insert mode

  " disable mouse support, what am I a vimposer?

  " run tests with :T
  " pretty much essential: by default in terminal mode, you have to press ctrl-\-n to get into normal mode
  " ain't nobody got time for that
  "tnoremap <Esc> <C-\><C-n>

  "tnoremap <A-h> <C-\><C-n><C-w>h
  "tnoremap <A-j> <C-\><C-n><C-w>j
  "tnoremap <A-k> <C-\><C-n><C-w>k
  "tnoremap <A-l> <C-\><C-n><C-w>l

  "nnoremap <A-h> <C-w>h
  "nnoremap <A-j> <C-w>j
  "nnoremap <A-k> <C-w>k
  "nnoremap <A-l> <C-w>l



" fugitive git bindings
nnoremap <space>gb :Gblame<CR><CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>go :Git checkout<Space>

let g:user_emmet_leader_key='<C-Z>'

" Set toggle paste
set pastetoggle=<F3>

" Vim Test Configurations
nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>

" VM
let g:VM_mouse_mappings = 1
let g:VM_theme = 'iceblue'
let g:VM_highlight_matches = 'underline'

let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'

" Mix Format

let g:mix_format_on_save = 1

nnoremap <leader>mf :MixFormat<cr>
nnoremap <leader>mfv :verb MixFormat<cr>
nnoremap <leader>mfd :MixFormatDiff<cr>

" TypeScript server
let g:coc_global_extensions = [ 'coc-tsserver' ]

" TypeScript autocomplete
" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()

set termguicolors     " enable true colors support

let ayucolor="mirage" " for mirage version of theme
silent! colorscheme ayu
"colorscheme dracula
"colorscheme nightfly
hi Normal guibg=NONE ctermbg=NONE
set noerrorbells visualbell t_vb=

" git blamer
"let g:blamer_enabled = 1
"let g:blamer_delay = 500
"highlight Blamer guifg=#000000


"autocmd Colorscheme * hi Keyword gui=italic cterm=italic
"autocmd Colorscheme * hi Repeat gui=italic cterm=italic
"autocmd Colorscheme * hi Special gui=italic cterm=italic
"autocmd Colorscheme * hi Boolean gui=italic cterm=italic
"autocmd Colorscheme * hi StorageClass gui=italic cterm=italic


 "Async, await
"highlight Keyword cterm=italic ctermfg=120

 ""Loops
"highlight Repeat cterm=italic

 ""Import, export
"highlight Special cterm=italic

 ""True, false
"highlight Boolean cterm=italic ctermfg=201

 ""let, var, const
"highlight StorageClass cterm=italic ctermfg=120

" Vim Flutter Configurations
let g:lsc_auto_map = v:true
nnoremap <leader>df :DartFmt<cr>
nnoremap <leader>flr :FlutterRun<cr>
nnoremap <leader>flq :FlutterQuit<cr>
nnoremap <leader>flh :FlutterHotReload<cr>
nnoremap <leader>flhr :FlutterHotRestart<cr>
nnoremap <leader>fld :FlutterVisualDebug<cr>
nnoremap <leader>flem :FlutterEmulators<cr>
nnoremap <leader>fldv :FlutterDevices<cr>

nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"set foldmethod=indent
"set foldlevelstart=1

