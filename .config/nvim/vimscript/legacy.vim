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

set autoindent
set smartindent
set shiftwidth=2

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...

" ===================================================
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

" Vim minimap config
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'
let g:minimap_highlight='Visual'

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Javascript
let g:hybrid_custom_term_colors = 0
let g:hybrid_reduced_contrast = 0
set background=dark
"colorscheme hybrid

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
let g:test#neovim#term_position = 'vert'
let g:test#neovim#start_normal = 1

let g:user_emmet_leader_key='<C-Z>'

" Set toggle paste
set pastetoggle=<F3>

" VM
let g:VM_mouse_mappings = 1
let g:VM_theme = 'iceblue'
let g:VM_highlight_matches = 'underline'

let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'

" Mix Format
let g:mix_format_on_save = 1

" TypeScript server
let g:coc_global_extensions = [ 'coc-tsserver' ]

set termguicolors     " enable true colors support

let ayucolor="mirage" " for mirage version of theme
silent! colorscheme ayu
hi Normal guibg=NONE ctermbg=NONE
set noerrorbells visualbell t_vb=

let g:lsc_auto_map = v:true

