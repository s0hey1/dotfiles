local status, ufo = pcall(require, 'ufo')
if not status then return end

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:│,foldclose:]]

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)

local capabilities = MyConfig.lsp.capabilities
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local ftMap = {
    vim = 'indent',
    git = ''
}

---@param bufnr number
---@return Promise
local function customizeSelector(bufnr)
    local function handleFallbackException(err, providerName)
        if type(err) == 'string' and err:match('UfoFallbackException') then
            return ufo.getFolds(bufnr, providerName)
        else
            return require('promise').reject(err)
        end
    end

    return ufo.getFolds(bufnr, 'lsp'):catch(function(err)
        return handleFallbackException(err, 'treesitter')
    end):catch(function(err)
        return handleFallbackException(err, 'indent')
    end)
end

local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, 'MoreMsg' })
    return newVirtText
end

ufo.setup({
    provider_selector = function(bufnr, filetype, buftype)
        return ftMap[filetype] or customizeSelector
    end,
    fold_virt_text_handler = handler,
})
--ufo.setup()

-- ufo.setup({
--     provider_selector = function(bufnr, filetype, buftype)
--         return { 'treesitter', 'indent' }
--     end
-- })
