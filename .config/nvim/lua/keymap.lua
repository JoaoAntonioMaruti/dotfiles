vim.api.nvim_set_keymap('', ',', '', { noremap = true, silent = true })
vim.g.mapleader = ','

vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? "\\<C-y>" : "\\<CR>"', { expr = true, noremap = true, silent = true })

-- Copy and paste clipboard
vim.api.nvim_set_keymap('n', '<C-y>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-y>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', '"+gP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-p>', '"+gP', { noremap = true, silent = true })

-- Disable arrow keys
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })

-- Better tabbing
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Window resizing
vim.api.nvim_set_keymap('n', '<M-j>', ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-k>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Disable mouse scroll wheel
vim.api.nvim_set_keymap('n', '<ScrollWheelUp>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-ScrollWheelUp>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-ScrollWheelUp>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelDown>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-ScrollWheelDown>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-ScrollWheelDown>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelLeft>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-ScrollWheelLeft>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-ScrollWheelLeft>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<ScrollWheelRight>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-ScrollWheelRight>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-ScrollWheelRight>', '<nop>', { noremap = true, silent = true })

-- Open Files
vim.api.nvim_set_keymap('n', '<space>e', ':e <C-R>=expand("%:p:h") . "/" <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>t', ':tabe <C-R>=expand("%:p:h") . "/" <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>v', ':vsp <C-R>=expand("%:p:h") . "/" <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>s', ':split <C-R>=expand("%:p:h") . "/" <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>r', ':r <C-R>=expand("%:p:h") . "/" <CR>', { noremap = true, silent = true })

-- Map 'q' to <Nop>
vim.api.nvim_set_keymap('', 'q', '<Nop>', { noremap = true, silent = true })

-- Autocmd to remove trailing whitespace before writing a buffer
vim.api.nvim_exec([[
    autocmd BufWritePre * %s/\s\+$//e
]], false)

-- Ack config
vim.cmd("cnoreabbrev Ack Ack!")
vim.cmd("cnoreabbrev ack Ack!")

-- Git
vim.cmd("cnoreabbrev git Git")

-- Tab navigation
vim.api.nvim_set_keymap('n', '<Tab>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':tabprevious<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>1', '1gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', '2gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', '3gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', '4gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', '5gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>6', '6gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>7', '7gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>8', '8gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>9', '9gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0', ':tablast<CR>', { noremap = true, silent = true })

-- Move to previous/next buffer
vim.api.nvim_set_keymap('n', '<leader>a', ':BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', ':BufferNext<CR>', { noremap = true, silent = true })

-- Re-order to previous/next
vim.api.nvim_set_keymap('n', '<A-<>', ':BufferMovePrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A->>', ':BufferMoveNext<CR>', { noremap = true, silent = true })

-- Goto buffer in position
for i = 1, 9 do
    vim.api.nvim_set_keymap('n', '<A-' .. i .. '>', ':BufferGoto ' .. i .. '<CR>', { noremap = true, silent = true })
end
vim.api.nvim_set_keymap('n', '<A-0>', ':BufferLast<CR>', { noremap = true, silent = true })

-- Pin/unpin buffer
vim.api.nvim_set_keymap('n', '<A-p>', ':BufferPin<CR>', { noremap = true, silent = true })

-- Close buffer
vim.api.nvim_set_keymap('n', '<A-c>', ':BufferClose<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-p>', ':BufferPick<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-p>', ':BufferPickDelete<CR>', { noremap = true, silent = true })

-- Sort automatically by...
vim.api.nvim_set_keymap('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>bd', ':BufferOrderByDirectory<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>bl', ':BufferOrderByLanguage<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>bw', ':BufferOrderByWindowNumber<CR>', { noremap = true, silent = true })

-- Vem tabline icon
vim.g.vem_tabline_show_icon = 1

-- Terminal commands
vim.api.nvim_set_keymap('n', 'term', ':vsp term://zsh<CR>', { noremap = true, silent = true })

-- Copy clipboard commands
vim.api.nvim_set_keymap('x', '<C-x>', ':!pbcopy<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-c>', ':w !pbcopy<CR><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-v>', ':!pbpaste<CR>', { noremap = true, silent = true })

-- Copy current file information to system clipboard (Mac specific)
if vim.fn.has("mac") or vim.fn.has("gui_macvim") or vim.fn.has("gui_mac") then
    vim.api.nvim_set_keymap('n', '<leader>cf', ':let @*=expand("%")<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>cF', ':let @*=expand("%:p")<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ct', ':let @*=expand("%:t")<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ch', ':let @*=expand("%:p:h")<CR>', { noremap = true, silent = true })
end

-- Navigation in splits tabs
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true, silent = true })

-- Clear search highlighting
vim.api.nvim_set_keymap('n', '<leader><space>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Toggle QuickFix window
vim.api.nvim_set_keymap('n', '<C-t>', ':call QuickFix_toggle()<CR>', { noremap = true, silent = true })

-- Switch to the alternate buffer
vim.api.nvim_set_keymap('n', '<Leader>b', ':e#<CR>', { noremap = true, silent = true })

-- GoTo code navigation
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gs', ':sp<CR><Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gv', ':vsp<CR><Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Coc Format Selected
vim.api.nvim_set_keymap('v', '<leader>f', '<Plug>(coc-format-selected)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(coc-format-selected)', { noremap = true, silent = true })

-- Dibu Toggle
vim.api.nvim_set_keymap('n', '<leader>db', ':DBUIToggle<CR>', { noremap = true, silent = true })

-- Telescope Mappings
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', ':Buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':History<CR>', { noremap = true, silent = true })

-- Elixir bindings
vim.api.nvim_set_keymap('n', 'pipe', ':ElixirDev pipelize<CR>', { silent = true })

-- Vim Tests bindings
vim.api.nvim_set_keymap('n', '<leader>t', ':TestNearest<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>T', ':TestFile<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':TestLast<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', ':TestVisit<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>wq', ':wq<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>ct', ':bd<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>sp', ':sp<CR><C-j><CR> :Startify<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>vs', ':vsp<CR><C-l><CR> :Startify<CR>', { silent = true })

-- Fugitive Git bindings
vim.api.nvim_set_keymap('n', '<space>gb', ':Gblame<CR><CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<space>ge', ':Gedit<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<space>gd', ':Gdiff<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<space>gs', ':Gstatus<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<space>gc', ':Gcommit -v -q<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<space>gt', ':Gcommit -v -q %:p<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<space>ga', ':Git add %:p<CR><CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<space>gr', ':Gread<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<space>gw', ':Gwrite<CR><CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<space>go', ':Git checkout<Space>', { silent = true })

vim.api.nvim_set_keymap('n', '<leader>mf', ':MixFormat<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>mfv', ':verb MixFormat<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>mfd', ':MixFormatDiff<cr>', { silent = true })

vim.api.nvim_set_keymap('i', '<Tab>', 'coc#refresh()', { expr = true, noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>df', ':DartFmt<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>flr', ':FlutterRun<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>flq', ':FlutterQuit<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>flh', ':FlutterHotReload<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>flhr', ':FlutterHotRestart<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>fld', ':FlutterVisualDebug<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>flem', ':FlutterEmulators<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>fldv', ':FlutterDevices<cr>', { silent = true })

vim.api.nvim_set_keymap('n', '<Leader>q"', 'ciw""<Esc>P', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q\'', 'ciw\'\'<Esc>P', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>qd', 'daW"=substitute(@@,"\'\\\\\\|\\"","","g")<CR>P', { silent = true })

vim.api.nvim_set_keymap('n', '<Leader>s', ':<C-u>call gitblame#echo()<CR>', { silent = true })

