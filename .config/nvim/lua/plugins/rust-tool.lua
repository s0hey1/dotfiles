return {
  "simrat39/rust-tools.nvim",
  lazy = true,
  ft = "rust",
  -- config = true,
  config = function(_, opts)
    local lsp_status = require("lsp-status")
    vim.tbl_deep_extend("force", vim.deepcopy(lsp_status.capabilities), opts.capabilities or {})
    require("rust-tools").setup({
      server = { on_attach = lsp_status.on_attach, capabilities = opts.capabilities },
    })
  end,
}
