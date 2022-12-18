local function markdown_preview_toggle()
    vim.keymap.set({ 'n', 'i' }, '<C-A-m>', '<cmd>MarkdownPreviewToggle<cr>', { buffer = true })
end

vim.api.nvim_create_autocmd(
    'FileType',
    {
        pattern = 'markdown',
        callback = function()
            vim.schedule(markdown_preview_toggle)
        end
    }
)
-- alternative command
-- vim.cmd([[autocmd FileType markdown nnoremap <buffer> <C-A-m> :MarkdownPreviewToggle<CR>]])
