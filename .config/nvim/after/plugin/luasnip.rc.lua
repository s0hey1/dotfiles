local luasnip_status, _ = pcall(require, 'luasnip')
if not luasnip_status then return end

-- local package_root = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
-- require('luasnip.loaders.from_vscode').lazy_load({ paths = { package_root .. "friendly-snippets" } })
require('luasnip.loaders.from_vscode').lazy_load()

-- vim.cmd([[
-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
--
-- " -1 for jumping backwards.
-- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
--
-- snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
-- snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
--
-- " For changing choices in choiceNodes (not strictly necessary for a basic setup).
-- imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
-- smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
-- ]])
