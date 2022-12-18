--vim.lsp.set_log_level("debug")

local status, lspconfig = pcall(require, "lspconfig")
if (not status) then return end
local lspsaga_status, _ = pcall(require, "lspsaga")

local protocol = require('vim.lsp.protocol')

protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end



-- Set up completion using nvim_cmp with LSP source
--local capabilities = require('cmp_nvim_lsp').default_capabilities()





vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
})

MyConfig.lsp.capabilities = vim.lsp.protocol.make_client_capabilities()
MyConfig.lsp.on_attach_handlers = {}
MyConfig.lsp.add_attach_handler = function(handler)
    table.insert(MyConfig.lsp.on_attach_handlers, handler)
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)

    --Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    if (not lspsaga_status) then
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    else
        vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', bufopts)
        vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', bufopts)
        vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", bufopts)
        --vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', bufopts)
        vim.keymap.set('n', '<leader>rn', '<Cmd>Lspsaga rename<CR>', bufopts)
        vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
        vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
        vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
        vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
        vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
    end

    for _, handler in pairs(MyConfig.lsp.on_attach_handlers) do
        handler(client, bufnr)
    end
end

MyConfig.lsp.default_on_attach_handler = on_attach

MyConfig.lsp.setup_handlers = {

    function(server_name)
        lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = MyConfig.lsp.capabilities,
            flags = {
                debounce_text_changes = 150,
            }
        }
    end,

    ['tsserver'] = function()
        lspconfig.tsserver.setup {
            on_attach = on_attach,
            filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
            --cmd = { "typescript-language-server", "--stdio" },
            capabilities = MyConfig.lsp.capabilities,
            flags = {
                debounce_text_changes = 150,
            }
        }
    end,
    ['sumneko_lua'] = function()
        lspconfig.sumneko_lua.setup {
            capabilities = MyConfig.lsp.capabilities,
            on_attach = function(client, bufnr)
                on_attach(client, bufnr)
                enable_format_on_save(client, bufnr)
            end,
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },

                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false
                    },
                },
            },
            flags = {
                debounce_text_changes = 150,
            }
        }
    end,
    ['clangd'] = function()
        -- clang_format for format with indent 4 put "IndentWidth: 4" into ~/.clang-format
        local capabilities = vim.deepcopy(MyConfig.lsp.capabilities)
        capabilities.offsetEncoding = { 'utf-16' }
        lspconfig.clangd.setup {
            handlers = require('lsp-status').extensions.clangd.setup(),
            init_options = {
                clangdFileStatus = true
            },
            on_attach = on_attach,
            capabilities = capabilities,
            flags = {
                debounce_text_changes = 150,
            }
        }
    end,

    ['rust_analyzer'] = function() end

}
