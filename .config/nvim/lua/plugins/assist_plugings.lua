return {
  { "mg979/vim-visual-multi", lazy = true, event = "VeryLazy" },
  { "godlygeek/tabular", lazy = true, event = "VeryLazy" },
  { "mattn/emmet-vim", lazy = true, event = "VeryLazy" },
  { --live edit html, css, and javascript in vim
    "turbio/bracey.vim",
    build = "npm install --prefix server",
  },
}
