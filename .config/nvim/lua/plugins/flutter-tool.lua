return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  lazy = true,
  ft = "dart",
  opts = function(_, opts)
    local lsp_status = require("lsp-status")
    opts.lsp = {
      on_attach = lsp_status.on_attach,
      capabilities = opts.capabilities,
    }
    local _, telescope = pcall(require, "telescope")
    telescope.load_extension("flutter")
  end,
}
