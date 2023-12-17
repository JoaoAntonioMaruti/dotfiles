-- Treesitter Config
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "dart", "javascript", "bash", "elixir", "lua", "vim" },

  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Use 'nocompatible' for Vim to work in a more modern way
vim.cmd('set nocompatible')

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Detect filetypes and enable corresponding plugins and indentations
vim.cmd('filetype on')
vim.cmd('filetype plugin indent on')

-- Increase the number of lines in the command-line history
vim.cmd('set history=1000')

-- Enable mouse support
vim.cmd('set mouse=a')

-- Show the command being typed
vim.cmd('set showcmd')

-- Show the current mode (e.g., -- INSERT --) at the bottom
vim.cmd('set showmode')

-- Highlight the current line and column
vim.cmd('set cursorline')
vim.cmd('set cursorcolumn')

-- Visual bell instead of sounds
vim.cmd('set visualbell')

-- Automatically reload files changed outside Vim
vim.cmd('set autoread')

-- Set font preferences for GUI (adjust font sizes accordingly)
vim.cmd('set guifont=Inconsolata\\ XL:h14,Inconsolata:h15,Monaco:17,Monospace')

-- Always display line numbers
vim.cmd('set number')

-- Set the number of lines of context to keep above and below the cursor
vim.cmd('set linespace=10')

-- Allow backspace to work in insert mode as expected
vim.cmd('set backspace=indent,eol,start')

-- Set 'scriptencoding' to UTF-8
vim.cmd('scriptencoding utf-8')

-- Set 'encoding' to UTF-8
vim.cmd('set encoding=utf-8')

-- Configure the clipboard to use the system clipboard
vim.cmd('set clipboard=unnamed')

-- Disable modeline (security risk)
vim.cmd('set nomodeline')

-- Check if 'rg' is executable
if vim.fn.executable('rg') then
  -- Set FZF default command
  vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

  -- Set grepprg to use rg
  vim.api.nvim_set_option('grepprg', 'rg --vimgrep')

  -- Define custom Find command using FZF and rg
  vim.cmd([[
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always " '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  ]])

  -- Define custom Rg command using FZF and rg
  vim.cmd([[
    command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " .. (<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
  ]])

  -- Map Rg search with the current word
  vim.api.nvim_set_keymap('n', '<leader>fw', [[:Rg <C-R><C-W><space> <CR>]], { noremap = true, silent = true })

  -- Map Rg search
  vim.api.nvim_set_keymap('n', '\\', [[:Rg <C-R><space>]], { noremap = true, silent = true })
end

-- NERDTree
vim.api.nvim_set_keymap('n', '<C-a>', [[:call NERDTreeToggleInCurDir()<CR>]], { noremap = true, silent = true })

function NERDTreeToggleInCurDir()
  if vim.fn.exists("t:NERDTreeBufName") and vim.fn.bufwinnr(vim.fn["t:NERDTreeBufName"]) ~= -1 then
    vim.cmd(":NERDTreeFocus")
  else
    if vim.fn.expand("%") == "" then
      vim.cmd(":NERDTreeToggle")
    else
      vim.cmd(":NERDTreeFind")
    end
  end
end

-- Multi-cursor quit key
vim.g.multi_cursor_quit_key = '<C-m>'

-- NERDTree configurations
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinPos = "right"
vim.g.NERDTreeWinSize = 100
vim.g.NERDTreeShowLineNumbers = 1

-- NERDTree git status icons
vim.g.NERDTreeGitStatusUseNerdFonts = 1
vim.g.NERDTreeGitStatusIndicatorMapCustom = {
  Modified  = '🦄',
  Staged    = '➕',
  Untracked = '⭐️',
  Renamed   = '🔜',
  Unmerged  = '🐣',
  Deleted   = '❌',
  Dirty     = '🤓',
  Ignored   = '🙋',
  Clean     = '✅',
  Unknown   = '❓',
}

-- Persistent Undo
if vim.fn.has('persistent_undo') == 1 then
  -- Ensure the directory exists (equivalent to mkdir -p)
  vim.fn.system('mkdir -p ~/.vim/backups > /dev/null 2>&1')

  -- Set undodir and enable undofile
  vim.o.undodir = '~/.vim/backups'
  vim.o.undofile = true
end

-- Turn Off Swap Files
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- Centralize backups, swapfiles, and undo history
vim.o.backupdir = '~/.vim/backups'
vim.o.directory = '~/.vim/swaps'
vim.o.undodir = '~/.vim/backups'
vim.o.undofile = true

-- Show always the status line
vim.o.laststatus = 2

-- Respect modeline in files
-- vim.o.modeline = true  -- Uncomment if you still want to use modeline
vim.o.modelines = 4

-- Disable error bells
vim.o.errorbells = false

vim.o.cmdheight = 2

-- Don’t reset cursor to the start of the line when moving around
vim.o.startofline = false

-- Don’t show the intro message when starting Vim
vim.o.shortmess = 'atI'

-- Show the current mode
vim.o.title = true

-- FZF layout and colors
vim.g.fzf_layout = { down = '40%' }
vim.g.fzf_colors = {
  fg = { 'fg', 'Normal' },
  bg = { 'bg', 'Normal' },
  hl = { 'fg', 'Comment' },
  fgplus = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
  bgplus = { 'bg', 'CursorLine', 'CursorColumn' },
  hlplus = { 'fg', 'Statement' },
  info = { 'fg', 'PreProc' },
  prompt = { 'fg', 'Conditional' },
  pointer = { 'fg', 'Exception' },
  marker = { 'fg', 'Keyword' },
  spinner = { 'fg', 'Label' },
  header = { 'fg', 'Comment' },
}

-- Autoindent and smartindent settings
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 2

-- Search settings
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true

-- Display tabs and trailing spaces visually
vim.o.list = true
vim.o.listchars = 'tab:  ,trail:·'

-- Do not wrap lines
vim.o.wrap = false
-- Wrap lines at convenient points
vim.o.linebreak = true

-- Configure persistent undo
if vim.fn.has('persistent_undo') == 1 then
  vim.fn.system('mkdir -p ~/.vim/backups > /dev/null 2>&1')
  vim.o.undodir = '~/.vim/backups'
  vim.o.undofile = true
end

-- FZF Buffer Delete
function s:list_buffers()
  return vim.fn.split(vim.fn.execute('ls'), "\n")
end

function s:delete_buffers(lines)
  vim.fn.execute('bwipeout ' .. table.concat(vim.fn.map(lines, 'split(v:val)[0]'), ' '))
end

vim.cmd("command! BD call fzf#run(fzf#wrap({ 'source': function('s:list_buffers'), 'sink*': function('s:delete_buffers'), 'options': '--multi --reverse --bind ctrl-a:select-all+accept' }))")

if vim.fn.has('nvim') == 1 then
  vim.api.nvim_set_keymap('t', '<C-o>', '<C-\\><C-n>', {})
end

vim.g.test_strategy = "neovim"
vim.g.test_neovim_term_position = 'vert'
vim.g.test_neovim_start_normal = 1

vim.g.user_emmet_leader_key = '<C-Z>'

-- Set toggle paste
vim.o.pastetoggle = '<F3>'

-- VM
vim.g.VM_mouse_mappings = 1
vim.g.VM_theme = 'iceblue'
vim.g.VM_highlight_matches = 'underline'

vim.g.VM_maps = {}
vim.g.VM_maps["Undo"] = 'u'
vim.g.VM_maps["Redo"] = '<C-r>'

-- Mix Format
vim.g.mix_format_on_save = 1

-- TypeScript server
vim.g.coc_global_extensions = { 'coc-tsserver' }

vim.o.termguicolors = true

vim.cmd("let ayucolor='mirage'")
vim.cmd("silent! colorscheme ayu")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("set noerrorbells visualbell t_vb=")

vim.g.lsc_auto_map = true

