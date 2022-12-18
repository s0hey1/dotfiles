local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup({ function(use)
    use 'wbthomason/packer.nvim'


    -- libraries
    use 'nvim-lua/plenary.nvim' -- Common utilities


    -- fonts
    use 'kyazdani42/nvim-web-devicons' -- File icons


    -- colorschems
    use {
        'svrana/neosolarized.nvim',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }
    use { 'ellisonleao/gruvbox.nvim' }


    -- ui
    use 'norcalli/nvim-colorizer.lua' --color highlighter
    use { -- status line
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    --use 'arkav/lualine-lsp-progress' -- LSP Progress lualine componenet
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }
    use 'rcarriga/nvim-notify' --notification manager ,not used in this time
    use 'folke/zen-mode.nvim'
    --use 'nvim-lua/popup.nvim'
    --use {'stevearc/dressing.nvim'}


    -- edit assistats
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use {
        'kylechui/nvim-surround',
        tag = "*"
    }
    use 'numToStr/Comment.nvim'
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use { -- multiple cursor
        'mg979/vim-visual-multi',
        branch = 'master'
    }
    use 'godlygeek/tabular'
    use 'mattn/emmet-vim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'mhartington/formatter.nvim' --often using null-ls instead.generalized lint/format engine with support for Prettier
    use { -- speed motion
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    }
    use 'tpope/vim-capslock'
    use { --universal folding , with lsp , treesitter
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async'
    }


    -- syntax
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    }
    use 'nvim-treesitter/nvim-treesitter-context' --shows the context of the currently visible buffer contents
    use 'nvim-treesitter/nvim-treesitter-textobjects' --Syntax aware text-objects, select, move, swap, and peek support
    use 'haringsrob/nvim_context_vt' --Shows virtual text of the current context after functions, methods, statements, etc.
    --use 'ziontee113/syntax-tree-surfer' --surf through your document and move elements around using the nvim-treesitter API


    -- code completion
    use 'hrsh7th/nvim-cmp' -- A completion engine plugin
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip' --luasnip completion source for nvim-cmp


    -- code snippet
    use 'rafamadriz/friendly-snippets'
    use {
        'L3MON4D3/LuaSnip',
        tag = 'v1.*'
    }


		
    -- LSP
    use 'neovim/nvim-lspconfig' -- configs for Nvim LSP
    use 'nvim-lua/lsp-status.nvim' --getting diagnostic status and progress messages from LSP servers
    use {
        'glepnir/lspsaga.nvim',
        branch = 'main',
    }
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'folke/lsp-colors.nvim' --
    use 'ray-x/lsp_signature.nvim' --LSP signature hint as you type
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    --use lspsaga instead
    --use { --A simple statusline/winbar component that uses LSP to show your current code context
    --  'SmiteshP/nvim-navic',
    --  requires = 'neovim/nvim-lspconfig'
    --}


    -- language tools
    use { --Tools to help create flutter apps in neovim using the native lsp
        'akinsho/flutter-tools.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use 'simrat39/rust-tools.nvim' --Tools for better development in rust using neovim's builtin lsp
    use { --live edit html, css, and javascript in vim
        'turbio/bracey.vim',
        run = 'npm install --prefix server'
    }

    -- Debuging
    use 'mfussenegger/nvim-dap' -- debug adapter
    use {
        'rcarriga/nvim-dap-ui',
        requires = 'mfussenegger/nvim-dap'
    }
    use 'theHamsta/nvim-dap-virtual-text'


		-- package manager for lsps, daps, linters, formatters
		use 'williamboman/mason.nvim' -- lsp servers and dap servers manager
		use 'williamboman/mason-lspconfig.nvim' --Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
		use 'jayp0521/mason-nvim-dap.nvim' --mason-nvim-dap bridges mason.nvim with the nvim-dap plugin 


    -- source code management
    use { --Single tabpage interface for easily cycling through diffs for all modified files for any git
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use { --Git integration for buffers,  fast git decorations
        'lewis6991/gitsigns.nvim',
        tag = 'v0.5'
    }
    --use 'f-person/git-blame.nvim' -- alternative for gitsigns
    use 'dinhhuy258/git.nvim' -- For git blame & browse
		use 'kdheepak/lazygit.nvim' -- lazygit ui


    -- project and session management
    use 'ahmedkhalf/project.nvim' --provides superior project management
    use 'rmagatti/auto-session' --automated session manager
    use { --A session-switcher extension for rmagatti/auto-session using Telescope.nvim
        'rmagatti/session-lens',
        requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
    }


    -- fuzzy finder
    use { --Find, Filter, Preview, Pick, extendable fuzzy finder over lists
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = 'nvim-lua/plenary.nvim'
    }
    use { --FZF sorter for telescope written in c
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    use 'nvim-telescope/telescope-file-browser.nvim' --file browser extension for telescope.nvim.It supports synchronized creation, deletion, renaming, and moving of files and folders
    --use 'nvim-telescope/telescope-ui-select.nvim' --use instead lspsaga ,neovim core stuff can fill the telescope picker
    use { --fzf is a general-purpose command-line fuzzy finder , for use in nvim-bqf
    		'junegunn/fzf', run = function()
    			vim.fn['fzf#install']()
				end
		}


    -- assistant panels
    use { --showing diagnostics, references, telescope results, quickfix and location lists
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
    }
    use { -- toggle terminal
        'akinsho/nvim-toggleterm.lua',
        tag = '*'
    }
    use { --Blazing fast minimap / scrollbar for vim
        'wfxr/minimap.vim',
        run = ':!cargo install --locked code-minimap',
    }
    use { -- A file explorer tree for neovim
        'kyazdani42/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',
        tag = 'nightly',
    }
    use 'simrat39/symbols-outline.nvim' --A tree like view for symbols in Neovim using the Language Server Protocol
    use 'kevinhwang91/nvim-bqf' -- nvim quickfix window, config not need, o and O close bqf window


    -- others
    use { --Preview markdown on your modern browser with synchronised scrolling
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
    }
    use 'neomake/neomake' -- Asynchronous linting and make framework , no setup needed
    use	'skywind3000/asyncrun.vim' -- setup not needed
    use { --tmux integration for nvim features pane movement and resizing from within nvim
        'aserowy/tmux.nvim', -- tmux compatibility, keybindings must be added in ~/.tmux.conf
    }
    use 'lambdalisue/suda.vim' -- read or write files with sudo command, config not needed

    if packer_bootstrap then
        require('packer').sync()
    end
end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        },
        profile = {
            enable = true,
            threshold = 1 -- the amount in ms that a plugin's load time must be over for it to be included in the profile
        }
    } })
