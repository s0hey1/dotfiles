local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "c", "cpp", "rust", "go",
        "python",
        "dart",
        "bash",
        "javascript",
        "tsx",
        "toml",
        "json",
        "yaml",
        "css",
        "html",
        "lua"
    },
    autotag = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

--vim.opt.foldlevel = 20
--vim.opt.foldmethod = 'expr'
--vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
--vim.opt.foldenable = true
