local project_status, project = pcall(require, 'project_nvim')
if not project_status then return end

project.setup()

local telescope_status, telescope = pcall(require, 'telescope')
if telescope_status then
    telescope.load_extension('projects')
    vim.keymap.set('n', '<leader><C-p>', function()
        telescope.extensions.projects.projects {}
    end, { silent = true, noremap = true })
end

local nvim_tree_status, nvim_tree = pcall(require, 'nvim-tree')
if nvim_tree_status then
    nvim_tree.setup {
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true
        },
    }
end
