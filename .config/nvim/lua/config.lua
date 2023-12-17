require'nvim-treesitter.configs'.setup {
  ensure_installed = { "dart", "javascript", "bash", "elixir", "lua", "vim" },

  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
