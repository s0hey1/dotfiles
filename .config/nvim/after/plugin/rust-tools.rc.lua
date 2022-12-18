local status, rust_tools = pcall(require, 'rust-tools')
-- if true then return end
if not status then return end

rust_tools.setup {
    server = {
        on_attach = MyConfig.lsp.default_on_attach_handler,
        capabilities = MyConfig.lsp.capabilities,
    },
}
