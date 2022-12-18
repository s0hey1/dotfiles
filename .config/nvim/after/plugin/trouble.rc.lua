local trouble_status, trouble = pcall(require, 'trouble')
if not trouble_status then return end

trouble.setup {}

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xll", "<cmd>TroubleToggle loclist<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>",
    { silent = true, noremap = true }
)


vim.keymap.set("n", "<leader>xn", function()
    trouble.next({ skip_groups = true, jump = true })
end,
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xp", function()
    trouble.previous({ skip_groups = true, jump = true })
end,
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xf", function()
    trouble.first({ skip_groups = true, jump = true })
end,
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", function()
    trouble.last({ skip_groups = true, jump = true })
end,
    { silent = true, noremap = true }
)
