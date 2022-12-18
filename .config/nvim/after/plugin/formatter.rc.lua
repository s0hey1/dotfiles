local status, formatter = pcall(require, "formatter")
if (not status) then return end

formatter.setup({

    filetype = {
        --lua = {
        ---- "formatter.filetypes.lua" defines default configurations for the
        ---- "lua" filetype
        --require("formatter.filetypes.lua").stylua,
        --},

        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
})
