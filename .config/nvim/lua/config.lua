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

vim.o.splitright = true

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

-- Set 'encoding' to UTF-8
vim.cmd('set encoding=utf-8')

-- Configure the clipboard to use the system clipboard
vim.cmd('set clipboard=unnamed')

-- Disable modeline (security risk)
vim.cmd('set nomodeline')

-- NERDTree
vim.api.nvim_set_keymap('n', '<C-a>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

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

-- Startify Header
vim.g.startify_custom_header = {
    '                   .mmMMMMMMMMMMMMMmm.                   João Antonio Maruti Milagres                  ',
    '               .mMMMMMMMMMMMMMMMMMMMMMMMm.               ----------------------------------------------',
    '            .mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm.            GitHub: https://github.com/joaoantoniomaruti  ',
    '          .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.          Linkedin: https://linkedin.com/in/joaomilagres',
    '        .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.        Email: joaoantoniomaruti@gmail.com            ',
    '       MMMMMMMM:  ``MMMMM````````MMMM``` :MMMMMMMM       Twitch: https://twitch.tv/joaoantoniomaruti   ',
    '      MMMMMMMMM                           MMMMMMMMM                                                    ',
    '     MMMMMMMMMM:                         :MMMMMMMMMM     Hard Skills                                   ',
    '    .MMMMMMMMMM                           MMMMMMMMMM.    - Elixir                                      ',
    '    MMMMMMMMM"                             "MMMMMMMMM    - Phoenix Framework                           ',
    '    MMMMMMMMM                               MMMMMMMMM    - Javascript and TypeScript                   ',
    '    MMMMMMMMM                               MMMMMMMMM    - React                                       ',
    '    MMMMMMMMMM                             MMMMMMMMMM    - GraphQL                                     ',
    '    `MMMMMMMMMM                           MMMMMMMMMM`                                                  ',
    '     MMMMMMMMMMMM.                     .MMMMMMMMMMMM                                                   ',
    '      MMMMMM  MMMMMMMMMM         MMMMMMMMMMMMMMMMMM                                                    ',
    '       MMMMMM   MMMMMMM           MMMMMMMMMMMMMMMM                                                     ',
    '        `MMMMMM  "MMMMM           MMMMMMMMMMMMMM`                                                      ',
    '          `MMMMMm                 MMMMMMMMMMMM`                                                        ',
    '            `"MMMMMMMMM           MMMMMMMMM"`                                                          ',
    '               `"MMMMMM           MMMMMM"`                                                             ',
    '                   `""M           M""`                   Website: https://joaoantoniomaruti.com.br     ',
}

vim.cmd([[
  set undodir=~/.vim/tmp
  set undofile
]])

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

vim.cmd("command! BD call fzf#run(fzf#wrap({ 'source': function('s:list_buffers'), 'sink*': function('s:delete_buffers'), 'options': '--multi --reverse --bind ctrl-a:select-all+accept' }))")

vim.g.user_emmet_leader_key = '<C-Z>'

-- Set toggle paste
vim.o.pastetoggle = '<F3>'

-- VM
vim.g.VM_mouse_mappings = 1
--vim.g.VM_theme = 'iceblue'
vim.g.VM_highlight_matches = 'underline'

vim.g.VM_maps = {}
vim.g.VM_maps["Undo"] = 'u'
vim.g.VM_maps["Redo"] = '<C-r>'

-- Mix Format
vim.g.mix_format_on_save = 1

-- TypeScript server
vim.g.coc_global_extensions = { 'coc-tsserver' }

vim.o.termguicolors = true

vim.g.lsc_auto_map = true
