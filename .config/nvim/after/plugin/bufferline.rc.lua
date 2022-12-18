local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
    options = {
        mode = "buffers",
        separator_style = 'thin',
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = true,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        },
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        },
    },
    --highlights = {
    --    separator = {
    --        fg = '#073642',
    --        bg = '#002b36',
    --    },
    --    separator_selected = {
    --        fg = '#073642',
    --    },
    --    background = {
    --        fg = '#657b83',
    --        bg = '#002b36'
    --    },
    --    buffer_selected = {
    --        fg = '#fdf6e3',
    --        bold = true,
    --    },
    --    fill = {
    --        bg = '#073642'
    --    }
    --},
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
