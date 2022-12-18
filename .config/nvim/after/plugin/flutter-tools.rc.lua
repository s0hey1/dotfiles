local status, flutter_tools = pcall(require, 'flutter-tools')
if not status then return end

flutter_tools.setup({
    -- flutter_path = "~/linuxSoftwares/flutter/bin",
    lsp = {
        on_attach = MyConfig.lsp.default_on_attach_handler,
        capabilities = MyConfig.lsp.capabilities,
    }
})

local telescope_status, telescope = pcall(require, 'telescope')
telescope.load_extension('flutter')
