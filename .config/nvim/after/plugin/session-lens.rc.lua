local session_lens_status, session_lens = pcall(require, 'session-lens')
if not session_lens_status then return end

session_lens.setup()
vim.keymap.set('n', '<leader><C-s>', function()
    session_lens.search_session()
end, { silent = true, noremap = true })

local telescope_status, telescope = pcall(require, 'telescope')
if telescope_status then
    telescope.load_extension('session-lens')
end
