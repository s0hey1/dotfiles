return {
  {
    "akinsho/toggleterm.nvim",
    init = function()
      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.keymap.set("t", [[<leader><C-\>]], [[<cmd>ToggleTermToggleAll<CR>]], { desc = "close toggleterm" })
      vim.keymap.set("n", [[<leader><C-\>]], [[<Cmd>ToggleTermToggleAll<CR>]], { desc = "open toggleterm" })
      vim.api.nvim_create_augroup("toggleterm", { clear = true })
      vim.api.nvim_create_autocmd({ "TermOpen" }, {
        group = "toggleterm",
        pattern = { "term://*" },
        callback = function()
          local opts = { buffer = 0 }
          vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
          vim.keymap.set("t", "<C-w>h", [[<C-\><C-N><C-w>h]], opts)
          vim.keymap.set("t", "<C-w>j", [[<C-\><C-N><C-w>j]], opts)
          vim.keymap.set("t", "<C-w>k", [[<C-\><C-N><C-w>k]], opts)
          vim.keymap.set("t", "<C-w>l", [[<C-\><C-N><C-w>l]], opts)
          vim.keymap.set("t", "<C-w><C-w>", [[<C-\><C-N><C-w><C-w>]], opts)
        end,
      })
    end,
    lazy = true,
    event = "VeryLazy",
    opts = {
      open_mapping = [[<c-\>]],
    },
  },
}
