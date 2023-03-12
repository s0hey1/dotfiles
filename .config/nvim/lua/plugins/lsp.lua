local function on_attach(client, bufn)
  local lsp_status = require("lsp-status")
  lsp_status.on_attach(client)
end
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        vls = function(_, opts)
          local lsp_status = require("lsp-status")
          vim.tbl_deep_extend("force", vim.deepcopy(lsp_status.capabilities), opts.capabilities or {})
          opts.cmd = { "vls" }
          opts.filetypes = { "vlang", "v" }
          opts.on_attach = function(client, bufn)
            client.server_capabilities.documentSymbolProvider = false
            client.server_capabilities.signatureHelpProvider = nil
            on_attach(client, bufn)
          end
        end,

        clangd = function(_, opts)
          local lsp_status = require("lsp-status")
          vim.tbl_deep_extend("force", vim.deepcopy(lsp_status.capabilities), opts.capabilities or {})
          opts.capabilities.offsetEncoding = { "utf-16" }
          opts.handlers = require("lsp-status").extensions.clangd.setup()
          opts.init_options = {
            clangdFileStatus = true,
          }
          opts.on_attach = on_attach
          opts.flags = {
            debounce_text_changes = 150,
          }
        end,

        rust_analyzer = function(_, _) end,

        ["*"] = function(_, opts)
          local lsp_status = require("lsp-status")
          vim.tbl_deep_extend("force", vim.deepcopy(lsp_status.capabilities), opts.capabilities or {})
          opts.on_attach = function(client, bufn)
            on_attach(client, bufn)
          end
        end,
      },
    },
  },
  {
    "nvim-lua/lsp-status.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    lazy = true,
    init = function()
      require("lsp-status").register_progress()
    end,
  },
}
