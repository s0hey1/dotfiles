local status, hop = pcall(require, "hop")
local status2, hop_hint = pcall(require, "hop.hint")
if (not (status and status2)) then return end

hop.setup({})

local directions = hop_hint.HintDirection
vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set('', 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

vim.keymap.set('n', '<leader>s', function() hop.hint_char1() end)
vim.keymap.set('n', '<leader>S', function() hop.hint_char2() end)
vim.keymap.set('n', '<leader>w', function() hop.hint_words() end)
vim.keymap.set('n', '<leader>l', function() hop.hint_lines() end)
vim.keymap.set('n', '<leader>p', function() hop.hint_patterns() end)
