local symbols_outline_status, symbols_outline = pcall(require, 'symbols-outline')
if not symbols_outline_status then return end

symbols_outline.setup()

vim.keymap.set({ 'n', 'i' }, '<C-A-s>', '<cmd>SymbolsOutline<cr>', {})
