-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local status, mason = pcall(require, 'mason')
if not status then
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
        }
    }
})

local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('grn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('gca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gic', require('telescope.builtin').lsp_incoming_calls, '[G]oto [I]ncoming calls')
    nmap('goc', require('telescope.builtin').lsp_outgoing_calls, '[G]oto [O]utgoing calls')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('gtd', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('gds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('gws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('gh', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('gk', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

vim.keymap.set('n', '<leader>0', "<cmd>ClangdSwitchSourceHeader<CR>")

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    clangd = {},
    pylsp = {
        configurationSources = "flake8",
    },
    rust_analyzer = {},
    tsserver = {},

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },

}

-- Setup neovim lua configuration
local setup_neodev, neodev = pcall(require, 'neodev')
if not setup_neodev then
    return
end

neodev.setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = {
        'c',
        'python',
        'cpp',
        'cuda',
        'html',
        'css',
        'bash',
        'lua',
        'rust',
        'tsx',
        'typescript',
        'vimdoc',
        'vim'
    },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = true,

    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
            },
        },
    },
}

-- autoformatting
require('lsp-format').setup {
    clangd = { tab_width = 4 },
}

local on_attach_format = function(client)
    require('lsp-format').on_attach(client)

    -- ... custom code ...
end

require('lspconfig').gopls.setup { on_attach = on_attach_format }

require'lspconfig'.glslls.setup{}

-- require('lspkind').init({
    -- -- DEPRECATED (use mode instead): enables text annotations
    -- --
    -- -- default: true
    -- -- with_text = true,
-- 
    -- -- defines how annotations are shown
    -- -- default: symbol
    -- -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    -- mode = 'symbol_text',
-- 
    -- -- default symbol map
    -- -- can be either 'default' (requires nerd-fonts font) or
    -- -- 'codicons' for codicon preset (requires vscode-codicons font)
    -- --
    -- -- default: 'default'
    -- preset = 'codicons',
-- 
    -- -- override preset symbols
    -- --
    -- -- default: {}
    -- symbol_map = {
      -- Text = "󰉿",
      -- Method = "󰆧",
      -- Function = "󰊕",
      -- Constructor = "",
      -- Field = "󰜢",
      -- Variable = "󰀫",
      -- Class = "󰠱",
      -- Interface = "",
      -- Module = "",
      -- Property = "󰜢",
      -- Unit = "󰑭",
      -- Value = "󰎠",
      -- Enum = "",
      -- Keyword = "󰌋",
      -- Snippet = "",
      -- Color = "󰏘",
      -- File = "󰈙",
      -- Reference = "󰈇",
      -- Folder = "󰉋",
      -- EnumMember = "",
      -- Constant = "󰏿",
      -- Struct = "󰙅",
      -- Event = "",
      -- Operator = "󰆕",
      -- TypeParameter = "",
    -- },
-- })
