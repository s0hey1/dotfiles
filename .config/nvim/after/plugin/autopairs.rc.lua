local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

-- If you want insert `(` after select function or method item
-- local status_cmp_autopair, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
-- local status_cmp, cmp = pcall(require, 'cmp')
-- if status_cmp_autopair and status_cmp then
--     cmp.event:on(
--         'confirm_done',
--         cmp_autopairs.on_confirm_done()
--     )
-- end

autopairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})
