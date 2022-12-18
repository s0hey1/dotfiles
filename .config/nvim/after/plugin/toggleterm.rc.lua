local toggleterm_status, toggleterm = pcall(require, 'toggleterm')
if not toggleterm_status then return end

toggleterm.setup {
    open_mapping = [[<c-\>]],
}


function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-w>h', [[<C-\><C-N><C-w>h]], opts)
    vim.keymap.set('t', '<C-w>j', [[<C-\><C-N><C-w>j]], opts)
    vim.keymap.set('t', '<C-w>k', [[<C-\><C-N><C-w>k]], opts)
    vim.keymap.set('t', '<C-w>l', [[<C-\><C-N><C-w>l]], opts)
    vim.keymap.set('t', '<C-w><C-w>', [[<C-\><C-N><C-w><C-w>]], opts)
    -- vim.keymap.set('t', [[<leader><C-\>]], [[<cmd>ToggleTermToggleAll<CR>]], opts)
    -- vim.keymap.set('n', [[<leader><C-\>]], [[<Cmd>ToggleTermToggleAll<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.keymap.set('t', [[<leader><C-\>]], [[<cmd>ToggleTermToggleAll<CR>]], {})
vim.keymap.set('n', [[<leader><C-\>]], [[<Cmd>ToggleTermToggleAll<CR>]], {})

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
