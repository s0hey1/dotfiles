"source ~/.vim/init.vim
"-----------------general----------------
set encoding=utf-8
set termbidi
" set guifont=Monospace:h12
"set guifont=Hack\ Nerd\ Font:h11
set guifont=Fira\ Mono:h10
syntax on
filetype on
filetype plugin indent on
set termguicolors
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set smarttab
set autoindent
set smartindent

set showmatch
set showcmd
" set ruler
set cursorline
set mouse=v
"set virtualedit for free edit any location
"set virtualedit=all
set virtualedit=block
"change leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

set number relativenumber

"fast change dir
"set autochdir
" autocmd BufEnter * silent! lcd %:p:h
command CDC cd %:p:h
nnoremap <silent><leader>cd :cd %:p:h<CR>:pwd<CR>

set nohlsearch
au TermClose * call feedkeys("i")

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set relativenumber
augroup END


"--------------------------neovide setup--------------------------------
" let g:neovide_cursor_vfx_mode = "railgun" //buggy
" let g:neovide_cursor_vfx_mode = "torpedo" //byggy
let g:neovide_cursor_vfx_mode = "pixiedust"

"-----------------vim-Plug pacman-------------
"Plug pkgman
call plug#begin('~/.config/nvim/plugged')

"-----------lib------------
Plug 'nvim-lua/plenary.nvim'
"for popup window 
Plug 'nvim-lua/popup.nvim'
"better interact with vim
Plug 'tjdevries/astronauta.nvim'
"An Interface to WEB APIs
Plug 'mattn/webapi-vim'

"-----------font----------- 
Plug 'kyazdani42/nvim-web-devicons'
Plug 'yamatsum/nvim-nonicons'
"nerd font
Plug 'ryanoasis/vim-devicons'
"vscode codicons
"Plug 'mortepau/codicons.nvim'

"----------git--------------
"fugitive git plugin
Plug 'tpope/vim-fugitive'
"git change line in source
Plug 'lewis6991/gitsigns.nvim'
"git blame, diffrence of code preview
Plug 'f-person/git-blame.nvim'
"diff veiwer
Plug 'sindrets/diffview.nvim'


"----------syntax---------
Plug 'nvim-treesitter/nvim-treesitter'
"watch syntax tree
Plug 'nvim-treesitter/playground'
"extended text object --treesitter based
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"show closing block owner
Plug 'haringsrob/nvim_context_vt'
"treesitter based surfer
Plug 'ziontee113/syntax-tree-surfer'


"---------lsp------
Plug 'neovim/nvim-lspconfig' 
"lsp status generator
Plug 'nvim-lua/lsp-status.nvim'
"lsp font for icon on completions
Plug 'onsails/lspkind-nvim'
"lsp ui 
"Plug 'glepnir/lspsaga.nvim'
"lsp signature , for function signature
Plug 'ray-x/lsp_signature.nvim'
"lsp language server installer
Plug 'williamboman/nvim-lsp-installer'
"lsp rooter , change current dir to project root
Plug 'ahmedkhalf/lsp-rooter.nvim' "insted use project.nvim
"trouble window
Plug 'folke/trouble.nvim'

"----------code completions---------
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

"------------snippet-------
"list of snip templates
Plug 'rafamadriz/friendly-snippets'
"snippet engine
Plug 'L3MON4D3/LuaSnip'
"vim-vsnip
Plug 'hrsh7th/vim-vsnip'


"----------language plugins------
Plug 'dart-lang/dart-vim-plugin'
Plug 'akinsho/flutter-tools.nvim'
"not need setup
Plug 'rust-lang/rust.vim'
"run line/blocs of code independently
Plug 'michaelb/sniprun', {'do': 'bash ./install.sh' }


"-----------color schemes----------
"not need setup
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'acarapetis/vim-colors-github'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'rakr/vim-one'
Plug 'junegunn/seoul256.vim'
Plug 'jnurmine/zenburn'
Plug 'kaicataldo/material.vim'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'whatyouhide/vim-gotham'
Plug 'sainnhe/everforest'
Plug 'projekt0n/github-nvim-theme'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }


"-----edit------
"surround, not need setup
Plug 'tpope/vim-surround'
"align text automaticaly, not need setup
Plug 'godlygeek/tabular'
"create table
"Plug 'dhruvasagar/vim-table-mode'
"comment assist
"main comment 3
"Plug 'b3nj5m1n/kommentary'
"main comment 2 
"Plug 'tpope/vim-commentary'
"todo comment
Plug 'folke/todo-comments.nvim'
"code comment base treesitter, depend on kommentary or vim-commentary
"Plug 'JoosepAlviste/nvim-ts-context-commentstring'
"treesitter based comment, main comment 1
Plug 'numToStr/Comment.nvim'
"multicourser
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"autopair
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
"auto format on close file
Plug 'mhartington/formatter.nvim'
"emmet , setup not needed
Plug 'mattn/emmet-vim'


"----------speed motion__________
"hop , easymotion like
Plug 'phaazon/hop.nvim'


"------------ui-------
"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"indentation guides, setup not needed
Plug 'lukas-reineke/indent-blankline.nvim'
"color highliter
Plug 'norcalli/nvim-colorizer.lua'
"toggleterm
Plug 'akinsho/nvim-toggleterm.lua'
"minimap
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
"--filetree setup
Plug 'kyazdani42/nvim-tree.lua'
"--tagbar --symbols-outline
Plug 'simrat39/symbols-outline.nvim'
"better quickfix window, setup not needed
Plug 'kevinhwang91/nvim-bqf'


"----------debuging---------------
"debug adapter protocol
Plug 'mfussenegger/nvim-dap'
"debug dap ui 
Plug 'rcarriga/nvim-dap-ui'
"debuger manager
Plug 'Pocco81/DAPInstall.nvim'


"----------fuzzy finders---------- 
"----telescope
Plug 'nvim-telescope/telescope.nvim'
"fzf 
Plug 'junegunn/fzf.vim'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }


"---------session management----- setup not needed
Plug 'rmagatti/auto-session'
"switch session based telescope
Plug 'rmagatti/session-lens'  

"---------project management-----
Plug 'ahmedkhalf/project.nvim'

"---------command---------
"async make
Plug 'neomake/neomake'
"running async shell command, 
Plug 'skywind3000/asyncrun.vim'
"read and write file with sudo
Plug 'lambdalisue/suda.vim' 

"---------tmux-----------
Plug 'preservim/vimux'

"---------live server bracey--------
"if not working, install dependencies manually
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server;pip3 install pynvim'}

call plug#end()

"---------theme---------
set background=dark
" set background=light
"colorscheme PaperColor
"colorscheme dracula
"colorscheme solarized
"colorscheme solarized8
"list of best theme:
"+gruvbox ++gruvbox-material +jellybeans +onedark ++seoul256 ++solarized8_flat ++sonokai +zenburn
" lua << EOF
" require("github-theme").setup({
"   functionStyle = "italic",
"   sidebars = {"qf", "vista_kind", "terminal", "packer"},

"   -- Change the "hint" color to the "orange" color, and make the "error" color bright red
"   colors = {hint = "orange", error = "#ff0000"},
"   themeStyle = "light",
" })
" EOF

autocmd vimenter * ++nested colorscheme gruvbox-material
"one halfdark
"set t_Co=256
"let g:airline_theme='sonokai'

"----------airline statusline---------
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"powerline symbol
" let g:airline_left_sep = ''
let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty=' ⚡'

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1

let g:airline_extensions = ['tabline', 'branch', 'term', 'fugitiveline', 'fzf']
"let g:airline#extensions#disable_rtp_load = 1
"let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#enabled = 1


"----------------treesitter setup----------------

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = false,
  },
  fold = {
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
EOF
"folding setup
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
"au BufRead * normal zR
"set nofoldenable

"treesitter status
lua <<EOF
function treesitter_status(ft)
    local ts_parsers = require"nvim-treesitter.parsers"
    for _, p in pairs(ts_parsers.available_parsers()) do
        if ts_parsers.has_parser(p) then
            if p == ft then
                return ' '
            end
        end
    end
    return '' 
end

EOF

function! TreeSitter_Status() abort
    return luaeval('treesitter_status(string.format("%s", _A))', &filetype)
endfunction

"-----------------treesitter text object-----------------
lua << EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
}
EOF

"---------------------treesitter syntax surfer-----------
lua <<EOF
require("syntax-tree-surfer").setup({
    highlight_group = "STS_highlight",
})
-- Syntax Tree Surfer
local opts = {noremap = true, silent = true}

-- Normal Mode Swapping:
-- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "vU", function()
	vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "vD", function()
	vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

-- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "vd", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "vu", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

--> If the mappings above don't work, use these instead (no dot repeatable)
-- vim.keymap.set("n", "vd", '<cmd>STSSwapCurrentNodeNextNormal<cr>', opts)
-- vim.keymap.set("n", "vu", '<cmd>STSSwapCurrentNodePrevNormal<cr>', opts)
-- vim.keymap.set("n", "vD", '<cmd>STSSwapDownNormal<cr>', opts)
-- vim.keymap.set("n", "vU", '<cmd>STSSwapUpNormal<cr>', opts)

-- Visual Selection from Normal Mode
vim.keymap.set("n", "vx", '<cmd>STSSelectMasterNode<cr>', opts)
vim.keymap.set("n", "vn", '<cmd>STSSelectCurrentNode<cr>', opts)

-- Select Nodes in Visual Mode
vim.keymap.set("x", "J", '<cmd>STSSelectNextSiblingNode<cr>', opts)
vim.keymap.set("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>', opts)
vim.keymap.set("x", "H", '<cmd>STSSelectParentNode<cr>', opts)
vim.keymap.set("x", "L", '<cmd>STSSelectChildNode<cr>', opts)

-- Swapping Nodes in Visual Mode
vim.keymap.set("x", "<A-j>", '<cmd>STSSwapNextVisual<cr>', opts)
vim.keymap.set("x", "<A-k>", '<cmd>STSSwapPrevVisual<cr>', opts)

--- jump to 
local sts = require("syntax-tree-surfer")
vim.keymap.set("n", "gj", function() -- jump to all that you specify
	sts.targeted_jump({
		"function",
	  "if_statement",
		"else_clause",
		"else_statement",
		"elseif_statement",
		"for_statement",
		"while_statement",
		"switch_statement",
        "variable_declaration",
        "arrrow_function",
        "function_definition",
	})
end, opts)

-- filtered_jump --
-- "default" means that you jump to the default_desired_types or your lastest jump types
vim.keymap.set("n", "<A-n>", function()
	sts.filtered_jump("default", true) --> true means jump forward
end, opts)
vim.keymap.set("n", "<A-p>", function()
	sts.filtered_jump("default", false) --> false means jump backwards
end, opts)

EOF

"---------------------lsp setup----------------------
lua << EOF
local function make_config(lsp_status, server, capabilities)
    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      --Enable completion triggered by <c-x><c-o>
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
      buf_set_option("formatexpr", "v:lua.vim.lsp.formatexpr()")
	  buf_set_option("tagfunc", "v:lua.vim.lsp.tagfunc")
      -- Mappings.
      local opts = { noremap=true, silent=true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
      buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

      lsp_status.on_attach(client)
      --lsp_signature setup
      require "lsp_signature".on_attach({
         bind = true,
         use_lspsaga = false,
         handler_opts = {
             border = "shadow"   -- double, single, shadow, none
         },
      })  -- Note: add in lsp client on-attach

      vim.cmd("set signcolumn=yes")
    end

    local config = {}

    if server == "cpp" or server == 'c' then   
        config = {
          handlers = lsp_status.extensions.clangd.setup(),
          init_options = {
            clangdFileStatus = true
          },
          on_attach = on_attach,
          capabilities = capabilities,
          flags = {
              debounce_text_changes = 150,
          }
        }
    else
        config = {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = {
              debounce_text_changes = 150,
          }
        }
    end

    return config
end

local function setup_servers()
  local lsp_installer = require('nvim-lsp-installer')
  local lsp_status = require('lsp-status')
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  lsp_status.register_progress()
  --snip support for nvim-compe
  lsp_status.capabilities.textDocument.completion.completionItem.snippetSupport = true
  lsp_status.capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
      }
  }
  --for _, server in pairs(servers) do
  --    require'lspconfig'[server].setup(make_config(lsp_status, server))
  --end
  lsp_installer.on_server_ready(function(server)
    local opts = make_config(lsp_status, server, capabilities) 

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
  end)

  --lspinstall not supported 
  --require'lspconfig'.dartls.setup({
  --    on_attach = lsp_status.on_attach,
  --    capabilities = lsp_status.capabilities
  --})
  --setup dart language and flutter
  require("flutter-tools").setup {
      ui = {
        -- the border type to use for all floating windows, the same options/formats
        -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
        border = "rounded",
      },
      debugger = { -- integrate with nvim dap + install dart code debugger
        enabled = false,
      },
      --flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
      --flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
      widget_guides = {
        enabled = false,
      },
      --closing_tags = {
      --  highlight = "ErrorMsg", -- highlight for the closing tag
      --  prefix = ">", -- character to use for close tag e.g. > Widget
      --  enabled = true -- set to false to disable
      --},
      dev_log = {
          enabled = false,
        open_cmd = "tabedit", -- command to use to open the log buffer
      },
      dev_tools = {
        autostart = false, -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
      },
      outline = {
        open_cmd = "30vnew", -- command to use to open the outline buffer
      },
      lsp = {
        on_attach = lsp_status.on_attach,
        capabilities = lsp_status.capabilities, -- e.g. lsp_status capabilities
        --- OR you can specify a function to deactivate or change or control how the config is created
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          --analysisExcludedFolders = {<path-to-flutter-sdk-packages>}
        }
      }
    }
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
--require'lspinstall'.post_install_hook = function ()
--  setup_servers() -- reload installed servers
--  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
--end

EOF

"--------------------lsp status-------------------------
lua <<EOF
local servers_alias = {
    ['cpp'] = 'clangd',
 --   ['clangd'] = 'clangd',
    [ 'c' ] = 'clangd',
    [ 'go' ] = 'gopls',
  --  [ 'rust_analyzer' ] = 'rust_analyzer',
    [ 'bash' ] = 'bashls',
    [ 'cmake' ] = 'cmakels',
    [ 'css' ] = 'cssls',
    [ 'html' ] = 'htmlls',
    [ 'json' ] = 'jsonls',
    [ 'latex' ] = 'texlab',
    [ 'lua' ] = 'luals',
    [ 'python' ] = 'pyright',
    [ 'typescript' ] = 'tsserver',
    [ 'vim' ] = 'vimls',
    [ 'vue' ] = 'vuels',
    [ 'yaml' ] = 'yamlls',
    [ 'dart' ] = 'dartls',
    [ 'dartls' ] = 'dartls',
    [ 'flutter' ] = 'dartls',
    [ 'sql' ] = 'sqls',
    [ 'dockerfile' ] = 'dockerls',
}
local default_config = {
  --spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'},
  --spinner_frames = {'', '', '', '','','','','','','','','','','','','','','','','','','','','','','',''},
  spinner_frames = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
    component_separator= ' '
}
spinner_frame_counter = 1
frame_counter = 1
local config = {}
config = vim.tbl_extend('force', config, default_config)
local lspStatus = require('lsp-status')
function get_lsp_progress()
  local buf_messages = lspStatus.messages()
  local msgs = {}
  local buf_clients = {}
    --local clients = vim.tbl_values(vim.lsp.get_active_clients())
   for _, c in pairs(vim.lsp.buf_get_clients()) do
 --      if servers_alias[c.name] ~= nil then
 --          buf_clients[servers_alias[c.name]]= '' 
 --      end
       buf_clients[c.name]= '' 
   end
    local contents = ''
    local txt = ''
  for _, msg in pairs(buf_messages) do
    --local name = servers_alias[msg.name] or 'not_found'
    local name = msg.name
    if buf_clients[name] ~= nil then
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
            buf_clients[name] = buf_clients[name] ..' '.. contents
        else
            buf_clients[name] = buf_clients[name] .. contents
        end
    end
  end
  for c, c_c in pairs(buf_clients) do
        if #c_c == 0 then
            buf_clients[c] = '  '..c..'  '
        else
            buf_clients[c] = '  '..c..' '..c_c
        end
        table.insert(msgs, buf_clients[c])
  end

  return table.concat(msgs, default_config.component_separator)
end


EOF

"---------------------lsp diag------------------------
lua <<EOF
local diagnostics = require('lsp-status/diagnostics')
function get_lsp_diag_errs()
    local buf_diag = diagnostics(0)
    if buf_diag.errors > 0 then
        return ' '..buf_diag.errors
    else
        return ''
    end
end

function get_lsp_diag_others()
    local diags = ''
    local buf_diag = diagnostics(0)
    if buf_diag.warnings > 0 then
        diags =  ' '..buf_diag.warnings
    end
    if buf_diag.info > 0 then
        if #diags > 0 then  
            diags = diags .. ' '
        end
        diags = diags .. ' '..buf_diag.info
    end
    if buf_diag.hints > 0 then 
        if #diags > 0 then  
            diags = diags .. ' '
        end
        diags = diags .. ''..buf_diag.hints
    end
    return diags
end
EOF

function! LspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("get_lsp_progress()")
    endif
    return '' 
endfunction

function! LspDiags_errs() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("get_lsp_diag_errs()")
    endif
    return '' 
endfunction
function! LspDiags_others() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("get_lsp_diag_others()")
    endif
    return '' 
endfunction
lua << EOF

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
EOF

"-----------------lspsaga setup-------------------
lua <<EOF
--require'lspsaga'.init_lsp_saga{
-- add your config value here
-- default value
--use_saga_diagnostic_sign = true,
--error_sign = '',
--warn_sign = '',
--hint_sign = '',
--infor_sign = '',
--dianostic_header_icon = '   ',
--code_action_icon = ' ',
--code_action_prompt = {
--   enable = true,
--   sign = true,
--   sign_priority = 20,
--   virtual_text = true,
--},
--finder_definition_icon = '  ',
--finder_reference_icon = '  ',
--max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
--finder_action_keys = {
--  open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
--},
--code_action_keys = {
--  quit = 'q',exec = '<CR>'
--},
--rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
--},
--definition_preview_icon = '  ',
---- "single" "double" "round" "plus"
--border_style = "single",
--rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}

--}
EOF
"async finder
" -- lsp provider to find the cursor word definition and reference
" nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" -- code action
" nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
" vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" -- show hover doc
" nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" -- scroll down hover doc or scroll in definition preview
" nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" -- scroll up hover doc
" nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" -- show signature help
" nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" -- rename
" nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
" -- preview definition
" nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" -- show diagnostic
" nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
" -- only show diagnostic if cursor is over the area
" nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
" -- jump diagnostic
" nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
" nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" -- float terminal also you can pass the cli command in open_float_terminal function
" nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR> -- or open_float_terminal('lazygit')<CR>
" tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>


"--------------------lspkind icon in autocomplete---------------
lua <<EOF
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    --with_text = true,

    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'default'
    --preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
--    symbol_map = {
--      Text = '',
--      Method = 'ƒ',
--      Function = '',
--      Constructor = '',
--      Variable = '',
--      Class = '',
--      Interface = 'ﰮ',
--      Module = '',
--      Property = '',
--      Unit = '',
--      Value = '',
--      Enum = '了',
--      Keyword = '',
--      Snippet = '﬌',
--      Color = '',
--      File = '',
--      Folder = '',
--      EnumMember = '',
--      Constant = '',
--      Struct = ''
--    },
})

EOF

"-------------------lsp rooter setup------------------
lua << EOF
  require("lsp-rooter").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

"------------------auto completions setup , nvim-cmp--------------
lua << EOF
-- Set completeopt to have a better completion experience
vim.opt.completeopt = {'menu','menuone','noselect'}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
-- nvim-Cmp setup
local cmp = require'cmp'
local luasnip = require("luasnip")
local lspkind = require('lspkind')

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        -- elseif vim.fn["vsnip#available"](1) == 1 then
        --   feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        -- elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        --   feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = "nvim_lsp_signature_help" },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      { name = "path" },
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    }),
    view = {                                                        
      entries = {name = 'custom', selection_order = 'near_cursor' } 
    }, 
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              vsnip = "[VSnip]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
            }) 
        }),
    },
  })
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
  -- Set configuration for specific filetype.
  -- cmp.setup.filetype('gitcommit', {
  --   sources = cmp.config.sources({
  --     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  --   }, {
  --     { name = 'buffer' },
  --   })
  -- })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

EOF
"--------------------trouble nvim setup------------------
"
" Trouble [mode]: open the list
" TroubleClose [mode]: close the list
" TroubleToggle [mode]: toggle the list
" TroubleRefresh: manually refresh the active list

lua <<EOF
require("trouble").setup{
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small poup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatyically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)

EOF

"-----------------luasnip setup-------------------

lua <<EOF
require("luasnip").config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
})
require("luasnip.loaders.from_vscode").lazy_load({ paths = {"./friendly-snippets"}})
--require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
EOF


"-----------------airline , treesitter , lsp setup---------------
"color setup
lua <<EOF
--local color  = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("airline_x")), "fg#")
--print(color)
--print('autocmd ColorScheme * highlight treesitter ctermfg=red ctermbg='..color)
EOF
"let g:mycolor=0
"execute 'autocmd Vimenter AirlineAfterInit  g:mycolor =' . 'autosynIDattr(synIDtrans(hlID('airline_x')), 'fg#')'


"status functions
function! Render_status()
    "execute 'autocmd ColorScheme * highlight treesitter ctermfg=red ctermbg=' . g:mycolor
    "let g:airline_section_x = airline#section#create_right(['%{LspStatus()}', '%#treesitter#%{TreeSitter_Status()}%#airline_x#', 'filetype'])
    " let g:airline_section_error = airline#section#create_right([''])
    let g:airline_section_error = airline#section#create_right(['%{LspDiags_errs()}'])
    " let g:airline_section_warning = airline#section#create_right([''])
    let g:airline_section_warning = airline#section#create_right(['%{LspDiags_others()}'])
    let g:airline_section_x = airline#section#create_right(['%{LspStatus()}', '%{TreeSitter_Status()}', 'filetype'])
endfunction


au User AirlineAfterInit call Render_status()
call timer_start(500, {-> execute(':let &stl=&stl')}, {'repeat': -1})


"----------------git setup-------------------------
"gitsign setup
lua <<EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
     current_line_blame = false,
     sign_priority = 6,
     update_debounce = 100,
     status_formatter = nil, -- Use default
     word_diff = false,
     diff_opts={
        internal = true,
     }
}
EOF

"-----------------------gitblame setup---------------
let g:gitblame_enabled = 0 "for toggle enable :GitBlameToggle 


"-------------------git diffview nvim---------------
" :DiffviewOpen
" :DiffviewOpen HEAD~2
" :DiffviewOpen HEAD~4..HEAD~2
" :DiffviewOpen d4a7b0d
" :DiffviewOpen d4a7b0d..519b30e
" :DiffviewClose
" :DiffviewToggleFiles
" :DiffviewFocusFiles
" :DiffviewRefresh
lua <<EOF
-- Lua
local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  use_icons = true ,       -- Requires nvim-web-devicons
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file 
      ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),       -- Open the diff for the selected entry.
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),          -- Stage all entries.
      ["U"]             = cb("unstage_all"),        -- Unstage all entries.
      ["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    }
  }
}

EOF

"-----------language plugin setup---------------
"------------------dartlang-----------------
let dart_html_in_string=v:true

"---------------sniprun setup------------------
" :SnipRun 	lua require'sniprun'.run() 	<Plug>SnipRun
" (normal node) 	lua require'sniprun'.run('n') 	<Plug>SnipRunOperator
" :'<,'>SnipRun (visual mode) 	lua require'sniprun'.run('v') 	<Plug>SnipRun
" :SnipInfo 	lua require'sniprun'.info() 	<Plug>SnipInfo
" :SnipReset 	lua require'sniprun'.reset() 	<Plug>SnipReset
" :SnipReplMemoryClean 	lua require'sniprun'.clear_repl() 	<Plug>SnipReplMemoryClean
" :SnipClose"  	lua require'sniprun.display'.close() 	<Plug>SnipClose
lua << EOF
require'sniprun'.setup({
  selected_interpreters = {},     --" use those instead of the default for the current filetype
  repl_enable = {},               --" enable REPL-like behavior for the given interpreters
  repl_disable = {},              --" disable REPL-like behavior for the given interpreters

  interpreter_options = {},       --" intepreter-specific options, consult docs / :SnipInfo <name>

  --" you can combo different display modes as desired
  display = {
    "Classic",                    -- "display results in the command-line  area
    "VirtualTextOk",              -- "display ok results as virtual text (multiline is shortened)

    -- "VirtualTextErr",          -- "display error results as virtual text
    --"TempFloatingWindow",      -- "display results in a floating window
    -- "LongTempFloatingWindow",  -- "same as above, but only long results. To use with VirtualText__
    -- "Terminal"                 -- "display results in a vertical split
    },

  --" customize highlight groups (setting this overrides colorscheme)
  snipruncolors = {
    SniprunVirtualTextOk   =  {bg="#66eeff",fg="#000000",ctermbg="Cyan",cterfg="Black"},
    SniprunFloatingWinOk   =  {fg="#66eeff",ctermfg="Cyan"},
    SniprunVirtualTextErr  =  {bg="#881515",fg="#000000",ctermbg="DarkRed",cterfg="Black"},
    SniprunFloatingWinErr  =  {fg="#881515",ctermfg="DarkRed"},
  },

  --" miscellaneous compatibility/adjustement settings
  inline_messages = 0,             --" inline_message (0/1) is a one-line way to display messages
				   --" to workaround sniprun not being able to display anything

  borders = 'shadow'               --" display borders around floating windows
                                   --" possible values are 'none', 'single', 'double', or 'shadow'
})
EOF

"------------neomake and asyncrun setup-----------------
"neomake setup
let g:neomake_open_list = 2

"asyncrun setup
let g:asyncrun_open = 8

"-------------------comment setup-----------------
"-------------------todo comment-----------------
":TodoQuickFix    This uses the quickfix list to show all todos in your project.
":TodoTrouble     List all project todos in trouble
":TodoTelescope   Search through all project todos with Telescope
"
lua <<EOF
require("todo-comments").setup{
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of hilight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
    warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
    info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
    hint = { "LspDiagnosticsDefaultHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}
EOF

"-------------------setup nvim-ts-context-commentstring---------------
lua <<EOF
--require'nvim-treesitter.configs'.setup {
--  context_commentstring = {
--    enable = true
--  }
--}
EOF

"-------------------kommentary setup----------------------
lua <<EOF
--require'nvim-treesitter.configs'.setup {
--  context_commentstring = {
--    enable = true,
--    enable_autocmd = false,
--  }
--}
--
--require('kommentary.config').configure_language('cpp', {
--  single_line_comment_string = 'auto',
--  multi_line_comment_strings = 'auto',
--  --single_line_comment_string = '//',
--  --multi_line_comment_strings = {'/*','*/'},
-- -- prefer_single_line_comments = true,
--  hook_function = function()
--    require('ts_context_commentstring.internal').update_commentstring()
--  end,
--})
--
--require('kommentary.config').use_extended_mappings()
----add language, if one commenting support other set to false
----require('kommentary.config').configure_language("rust", {
----    single_line_comment_string = "//",             
----    multi_line_comment_strings = {"/*", "*/"},
----    --prefer_single_line_comments = true,
----    --prefer_multi_line_comments = true,
----})
EOF

"----------------Comment.nvim--setup----------------
lua require('Comment').setup()

"----------------nvim autopair setup-----------------
lua <<EOF
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt"  },
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", ""),
  enable_moveright = true,
  enable_afterquote = true,  -- add bracket pairs after quote
  enable_check_bracket_line = true,  --- check bracket in same line
  check_ts = false,
  ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
  fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      hightlight = 'Search'
  },
})
-- require("nvim-autopairs.completion.cmp").setup({
--   map_cr = true, --  map <CR> on insert mode
--   map_complete = true -- it will auto insert `(` after select function or method item
-- })

EOF

"------------------nvim autotag----------------------
lua <<EOF
require('nvim-ts-autotag').setup()
EOF


"----------------nvim colorizer setup---------------
lua <<EOF
require 'colorizer'.setup()
EOF

"-------------nvim toggleterm setup--------------------
set hidden

lua <<EOF
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size =  function(term)
    if term.direction == "horizontal" then
      return 12
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  --direction = 'vertical' | 'horizontal' | 'window' | 'float',
  direction = 'horizontal' ,
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  --float_opts = {
  --  -- The border key is *almost* the same as 'nvim_win_open'
  --  -- see :h nvim_win_open for details on borders however
  --  -- the 'curved' border is a custom border type
  --  -- not natively supported but implemented in this plugin.
  --  border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
  --  width = <value>,
  --  height = <value>,
  --  winblend = 3,
  --  highlights = {
  --    border = "Normal",
  --    background = "Normal",
  --  }
  --}
}
EOF
tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l
tnoremap <C-w><C-w> <C-\><C-N><C-w><C-w>
tnoremap <leader><C-\> <cmd>ToggleTermOpenAll<CR>
tnoremap <leader><C-\><C-\> <cmd>ToggleTermCloseAll<CR>
" inoremap <C-w>h <C-\><C-N><C-w>h
" inoremap <C-w>j <C-\><C-N><C-w>j
" inoremap <C-w>k <C-\><C-N><C-w>k
" inoremap <C-w>l <C-\><C-N><C-w>l
" inoremap <C-w><C-w> <C-\><C-N><C-w><C-w>
" inoremap <silent><leader><C-\> <Esc><Cmd>ToggleTermOpenAll<CR>
nnoremap <silent><leader><C-\> <Cmd>ToggleTermOpenAll<CR>
" inoremap <silent><leader><C-\><C-\> <Esc><Cmd>ToggleTermCloseAll<CR>
nnoremap <silent><leader><C-\><C-\> <Cmd>ToggleTermCloseAll<CR>
"""""""""""""""""""""""""""""""""""termdebug plugin"""""""""""""""""""""""""""""""""""
"----------------------dap setup--------------------------
"-----------------------dap ui setup----------------------
"
lua <<EOF
require('dapui').setup{
  icons = {
    expanded = "▾",
    collapsed = "▸"
  },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = {"<CR>", "<2-LeftMouse>"},
    open = "o",
    remove = "d",
    edit = "e",
  },
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil,   -- Floats will be treated as percentage of your screen.
  },
}
--require('dap.ext.vscode').load_launchjs()

EOF

"-------------------dap setup and dap install setup------------------
lua <<EOF
--require("dap-install").setup()
--local dap_install = require("dap-install")
--local dbg_list = require("dap-install.debuggers_list").debuggers
--
--for debugger, _ in pairs(dbg_list) do
--	dap_install.config(debugger, {})
--end
local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

---local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
}
-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = os.getenv('HOME')..'/.local/share/nvim/dapinstall/python_dbg/bin/python';
  args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

dap.adapters.go = function(callback, config)
local handle
local pid_or_err
local port = 38697
handle, pid_or_err =
  vim.loop.spawn(
  "dlv",
  {
    args = {"dap", "-l", "127.0.0.1:" .. port},
    detached = true
  },
  function(code)
    handle:close()
    print("Delve exited with exit code: " .. code)
  end
)
-- Wait 100ms for delve to start
vim.defer_fn(
  function()
    --dap.repl.open()
    callback({type = "server", host = "127.0.0.1", port = port})
  end,
100)


--callback({type = "server", host = "127.0.0.1", port = port})
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}"
    },
    {
      type = "go",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}"
    }
}

dap.adapters.dart = {
    type = "executable",
    command = "node",
    args = {os.getenv('HOME').."/.local/share/nvim/dapinstall/dart_dbg/Dart-Code/out/dist/debug.js", "flutter"}
}
dap.configurations.dart = {
{
    type = "dart",
  request = "launch",
  name = "Launch flutter",
  dartSdkPath = os.getenv('HOME').."/linuxSoftware/flutter/bin/cache/dart-sdk/",
  flutterSdkPath = os.getenv('HOME').."/linuxSoftware/flutter",
  program = "${workspaceFolder}/lib/main.dart",
  cwd = "${workspaceFolder}",
}
}

EOF
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F6> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F8> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>


"--------------------telescope setup---------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"--------------------fzf setup-----------------------
"dep -> the_silver_searcher , ripgrep
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

"---------------------hop setup-------------------------
lua <<EOF
require'hop'.setup()
vim.api.nvim_set_keymap('n', '<leader>s', "<cmd>lua require'hop'.hint_char1()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>S', "<cmd>lua require'hop'.hint_char2()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>w', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>l', "<cmd>lua require'hop'.hint_lines()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>p', "<cmd>lua require'hop'.hint_patterns()<cr>", {})
EOF


"-----------------------------nvim tree setup------------------------------
" let g:nvim_tree_side = 'left' "left by default
" let g:nvim_tree_width = 30 "30 by default, can be width_in_columns or 'width_in_percent%'
" let g:tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
" let g:tree_gitignore = 1 "0 by default
" let g:tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
" let g:tree_auto_close = 1 "0 by default, closes the tree when it's the last window
" let g:nvim_tree_auto_ignore_ft = [] "empty by default, don't auto open tree on specific filetypes.
" let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
" let g:tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
" let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
" let g:tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
" let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
" let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
" let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
" let g:tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
" let g:tree_auto_resize = 1 "1 by default, will resize the tree to its saved width when opening a file
" let g:tree_disable_netrw = 0 "1 by default, disables netrw
" let g:tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
" let g:nvim_tree_add_trailing = 0 "0 by default, append a trailing slash to folder names
" let g:nvim_tree_group_empty = 0 " 0 by default, compact folders that only contain a single folder into one node in the file tree
" let g:tree_lsp_diagnostics = 0 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
" let g:nvim_tree_disable_window_picker = 0 "0 by default, will disable the window picker.
" let g:tree_hijack_cursor = 0 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
" let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
" let g:tree_update_cwd = 0 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
" let g:nvim_tree_window_picker_exclude = {
"     \   'filetype': [
"     \     'packer',
"     \     'qf'
"     \   ],
"     \   'buftype': [
"     \     'terminal'
"     \   ]
"     \ }
" " Dictionary of buffer option names mapped to a list of option values that
" " indicates to the window picker that the buffer's window should not be
" " selectable.
" let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
" let g:nvim_tree_show_icons = {
"     \ 'git': 1,
"     \ 'folders': 1,
"     \ 'files': 1,
"     \ 'folder_arrows': 1,
"     \ }
" "If 0, do not show the icons for one of 'git' 'folder' and 'files'
" "1 by default, notice that if 'files' is 1, it will only display
" "if nvim-web-devicons is installed and on your runtimepath.
" "if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
" "but this will not work when you set indent_markers (because of UI conflict)
"
" " default will show icon by default if no icon is provided
" " default shows no icon by default
" let g:nvim_tree_icons = {
"     \ 'default': '',
"     \ 'symlink': '',
"     \ 'git': {
"     \   'unstaged': "✗",
"     \   'staged': "✓",
"     \   'unmerged': "",
"     \   'renamed': "➜",
"     \   'untracked': "★",
"     \   'deleted': "",
"     \   'ignored': "◌"
"     \   },
"     \ 'folder': {
"     \   'arrow_open': "",
"     \   'arrow_closed': "",
"     \   'default': "",
"     \   'open': "",
"     \   'empty': "",
"     \   'empty_open': "",
"     \   'symlink': "",
"     \   'symlink_open': "",
"     \   },
"     \   'lsp': {
"     \     'hint': "",
"     \     'info': "",
"     \     'warning': "",
"     \     'error': "",
"     \   }
"     \ }

nnoremap <silent><leader><C-n> :NvimTreeToggle<CR>
nnoremap <silent><leader>r :NvimTreeRefresh<CR>
nnoremap <silent><leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

"set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
lua <<EOF
require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  view = {
    number = false,
    relativenumber = false,
  }
})
EOF
"--------------------------symbol outline setup , tagbar----------------
lua <<EOF
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
}
EOF


"------------------formatter nvim setup-----------------
lua <<EOF
require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
    lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 4, "--stdin"},
            stdin = true
          }
        end
    },
    cpp = {
        -- clang-format
       function()
          return {
            exe = "clang-format",
            args = {},
            stdin = true,
            cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
          }
        end
    }
  }
})
EOF


"--------------------------minimap.vim setup-------------------------------
let g:minimap_width = 10
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1


"--------------------------auto-session setup-----------------------------
lua <<EOF
require('auto-session').setup {
    auto_session_enable_last_session=false,
    auto_restore_enable=false
}
-- require('session-lens').search_session()
EOF

"---------project management-----
lua <<EOF
require("project_nvim").setup{}
require('telescope').load_extension('projects')
-- require('session-lens').setup({})
-- require("telescope").load_extension("session-lens")
EOF

"---------vim-visual-multi---------
let g:VM_mouse_mappings = 1
set mouse=a

"--------live server Bracey-------
"
