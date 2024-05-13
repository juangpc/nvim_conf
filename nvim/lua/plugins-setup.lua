local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        print("Packer is not installed. Downloading...")
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
    augroup packer_user_config autocmd!
    autocmd BufWrite plugins-setup.lua source <afile> | PackerSync
    augroup end 
]])

local status, packer = pcall(require, 'packer')
if not status then
    print("problem with packer installation.")
    return
end

packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'sharkdp/fd'

    use 'Etiamnullam/deferred-clipboard.nvim'

    -- Telescope related
    use { 'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    -- LSP Configuration & Plugins
    use {
        'williamboman/mason.nvim',
        --config = true,
        run = ':MasonUpdate',         -- :MasonUpdate updates registry contents
        requires = {
            'williamboman/mason-lspconfig.nvim'
        }
    }
    use {     -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason-lspconfig.nvim',
            -- Useful status updates for LSP
            'j-hui/fidget.nvim',
            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
        },
        opts = {
            setup = {
                clangd = function (_, opts)
                    opts.capabilities.offsetEncoding = { "utf-16" }
                end
            }
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        run = ':TSUpdate',
    }

    -- auto formatting
    use 'lukas-reineke/lsp-format.nvim'
    use {'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {}}
    use 'm4xshen/autoclose.nvim'

    -- Autocompletion
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'        -- autocompletion of paths
    use 'hrsh7th/cmp-cmdline'     -- autompletion for commanline
    use { 'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
    }

    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }         -- set lualine as the status line
    }

    -- theme plugins
    use { 'ellisonleao/gruvbox.nvim' }
    use { 'navarasu/onedark.nvim' }
    use { 'folke/tokyonight.nvim' ,
        lazy = false,
        priority = 1000,
        opts = {},
    }

    use 'natecraddock/sessions.nvim'     -- sessions
    use 'szw/vim-maximizer'              -- maximize splits
    use 'folke/zen-mode.nvim'
    use 'akinsho/toggleterm.nvim'        -- toggle terminal
    use 'mbbill/undotree'

    use 'simrat39/symbols-outline.nvim'
    use 'numToStr/Comment.nvim'     -- 'gc' to comment visual regions

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
