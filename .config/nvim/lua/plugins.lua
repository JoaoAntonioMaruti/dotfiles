vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use "Danielwsx64/elixir-dev.nvim"

  use {
    'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

   -- Packer itself
    use 'wbthomason/packer.nvim'

    -- Themes
    use 'ayu-theme/ayu-vim'

    -- Git
    use {
        'airblade/vim-gitgutter',
        requires = 'Xuyuanp/nerdtree-git-plugin'
    }

    -- UI
    use 'akinsho/bufferline.nvim'
    use {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup()
        end
    }
    use 'mhinz/vim-startify'
    use 'severin-lemaignan/vim-minimap'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- Navigation
    use 'preservim/nerdtree'
    use 'ryanoasis/vim-devicons'

    -- Code Completion and LSP
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = function()
            vim.cmd('source $HOME/.config/nvim/coc.vim')
        end
    }
    use 'SirVer/ultisnips'

    -- Language Support
    use 'elixir-editors/vim-elixir'
    use 'mhinz/vim-mix-format'
    use 'slashmili/alchemist.vim'
    use 'neomake/neomake'
    use {'elixir-lsp/coc-elixir', run = 'yarn install && yarn prepack'}
    use 'mhanberg/elixir.nvim'
    use 'rust-lang/rust.vim'
    use 'neoclide/coc-rls'
    use 'leafgarland/typescript-vim'
    use 'maxmellon/vim-jsx-pretty'
    use 'jparise/vim-graphql'

    -- Other Plugins
    use 'dracula/vim'
    use 'w0ng/vim-hybrid'
    use 'sheerun/vim-polyglot'
    use 'tpope/vim-fugitive'
    use 'ap/vim-css-color'
    use 'tpope/vim-surround'
    use {
        'junegunn/fzf',
        run = function() vim.fn['fzf#install']() end
    }
    use 'junegunn/fzf.vim'
    use 'scrooloose/nerdcommenter'
    use 'tpope/vim-eunuch'
    use 'mg979/vim-visual-multi'
    use 'vim-test/vim-test'
    use 'styled-components/vim-styled-components'
    use 'etdev/vim-hexcolor'
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'aserebryakov/vim-todo-lists'
    use 'tomswartz07/vim-todo'
    use 'CoderCookE/vim-chatgpt'
    use 'fabi1cazenave/termopen.vim'
    use 'kassio/neoterm'
    use 'zivyangll/git-blame.vim'
    use 'qpkorr/vim-bufkill'
    use 'iamcco/coc-spell-checker'
    use 'terryma/vim-multiple-cursors'
    use 'wordijp/vim-vimscript-scope-syntax'
    use 'radgeRayden/vim-scopes'
    use 'nathanaelkane/vim-indent-guides'
    use 'evanleck/vim-svelte'
    use 'mileszs/ack.vim'
    use {'prettier/vim-prettier', run = 'yarn install'}
    use 'dart-lang/dart-vim-plugin'
    use 'natebosch/vim-lsc'
    use 'natebosch/vim-lsc-dart'
    use 'thosakwe/vim-flutter'
    use 'pangloss/vim-javascript'
end)
