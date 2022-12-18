local section_x = nil
local status, lualine = pcall(require, "lualine")
if (not status) then return end
section_x = {
    { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
        hint = ' ' } },
}

local l_status, lsp_status = pcall(require, "lsp-status")
local lualine_schduled = false
if (l_status) then
    local default_config = {
        --spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'},
        --spinner_frames = {'', '', '', '','','','','','','','','','','','','','','','','','','','','','','',''},
        spinner_frames = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
        component_separator = ' '
    }
    local spinner_frame_counter = 1
    local frame_counter = 1
    local config = {}
    config = vim.tbl_extend('force', config, default_config)
    local function get_lsp_status()
        local buf_clients = {}
        local client_exist = false
        for _, client in pairs(vim.lsp.buf_get_clients()) do
            buf_clients[client.name] = ''
            client_exist = true
        end
        if not client_exist then
            return ''
        end

        local buf_messages = lsp_status.messages()
        local msgs = {}
        local curr_content = nil
        local contents = ''
        for _, msg in pairs(buf_messages) do
            local name = msg.name
            if buf_clients[name] ~= nil and msg.content ~= 'idle' then
                if msg.progress or (msg.status and curr_content ~= msg.content) then
                    contents = config.spinner_frames[(spinner_frame_counter % #config.spinner_frames) + 1]
                    frame_counter = frame_counter + 1
                    if frame_counter % 2 == 0 then
                        spinner_frame_counter = spinner_frame_counter + 1
                    end
                    if msg.status then
                        curr_content = msg.content
                    end
                end
                if #buf_clients[name] > 0 and #contents > 0 then
                    buf_clients[name] = buf_clients[name] .. ' ' .. contents
                else
                    buf_clients[name] = buf_clients[name] .. contents
                end
            end
        end
        for c, c_c in pairs(buf_clients) do
            if #c_c == 0 then
                buf_clients[c] = '  ' .. c .. '  '
            else
                buf_clients[c] = '  ' .. c .. ' ' .. c_c
            end
            table.insert(msgs, buf_clients[c])
        end
        if #contents > 0 and not lualine_schduled then
            lualine_schduled = true
            vim.defer_fn(function()
                vim.schedule(function()
                    lualine_schduled = false
                    lualine.refresh()
                end)
            end, 50)
        end
        -- return lsp_status.status()
        return table.concat(msgs, default_config.component_separator)
    end

    table.insert(section_x, get_lsp_status)

end

local t_status, treesitter = pcall(require, "nvim-treesitter.parsers")
if (t_status) then
    table.insert(section_x, function()
        local ft = vim.bo.filetype
        for _, parser in pairs(treesitter.available_parsers()) do
            if treesitter.has_parser(parser) then
                if parser == ft then
                    return ' '
                    --return '🌲'
                    --return '🌳'
                end
            end
        end
        return ''
    end
    )
end

table.insert(section_x, 'filetype')
table.insert(section_x, 'encoding')
table.insert(section_x, 'fileformat')

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'ayu_dark', --'iceberg_dark', 'ayu_mirage', 'solarized_dark', 'auto',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {},
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
            -- 'lsp_progress',
            --{
            --'lsp_progress',
            --display_components = { 'lsp_client_name', 'spinner', {} },
            --separators = {
            --component = '',
            --progress = '',
            --message = { pre = '(', post = ')' },
            --percentage = { pre = '', post = '%% ' },
            --title = { pre = '', post = ': ' },
            --lsp_client_name = { pre = ' ', post = ' ' },
            --spinner = { pre = '', post = '' },
            --message = { commenced = 'In Progress', completed = 'Completed' },
            --},
            --timer = { progress_enddelay = 500, spinner = 500, lsp_client_name_enddelay = 1000 },
            --spinner_symbols = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
            --},
        },
        lualine_x = section_x,
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
        } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {
        'fugitive',
        'nvim-tree',
        'nvim-dap-ui',
        'quickfix',
        'symbols-outline',
        'toggleterm',
    }
}

--vim.cmd([[call timer_start(50, {-> execute(':let &stl=&stl')}, {'repeat': -1})]])
