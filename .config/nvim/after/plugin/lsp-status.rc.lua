local status, lsp_status = pcall(require, 'lsp-status')
if not status then return end

lsp_status.register_progress()
MyConfig.lsp.capabilities = vim.tbl_extend('keep', MyConfig.lsp.capabilities or {}, lsp_status.capabilities)

MyConfig.lsp.add_attach_handler(lsp_status.on_attach)
