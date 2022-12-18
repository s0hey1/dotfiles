local mason_status, mason = pcall(require, "mason")
if (not mason_status) then return end
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not mason_lspconfig_status) then return end
local mason_dap_status, mason_dap = pcall(require, 'mason-nvim-dap')

mason.setup({

})

mason_lspconfig.setup {
    automatic_installation = true
}

mason_lspconfig.setup_handlers(MyConfig.lsp.setup_handlers)

if mason_dap_status then
    mason_dap.setup({
        ensure_installed = {},
        automatic_setup = true
    })

    mason_dap.setup_handlers(MyConfig.dap.setup_handlers)
end
