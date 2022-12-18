vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.guifont = 'Fira Mono:h12'
vim.opt.termbidi = true
vim.go.neovide_cursor_vfx_mode = 'pixiedust'
vim.opt.showmatch = true
vim.opt.showcmd = true
--vim.opt.mouse = 'v'
vim.opt.virtualedit = 'block'
vim.cmd([[syntax on]])
vim.cmd([[filetype on]])
vim.cmd([[filetype plugin indent on]])
vim.cmd([[au TermClose * call feedkeys("i")]])

--fast change dir
vim.cmd([[command CDC cd %:p:h]])

vim.wo.number = true
vim.wo.relativenumber = true
vim.g.mapleader = " " -- map leader to space
vim.opt.signcolumn = 'yes'

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
