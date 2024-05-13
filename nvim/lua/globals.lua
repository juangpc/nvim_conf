vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.showcmd = true
vim.o.cmdheight = 1

vim.o.tabstop = 4        -- How tabs are displayed. How many whitespaces a tab character (\t) should be equal to?
vim.o.softtabstop = 4    -- How many whitespaces is a tab-key-press worth?
vim.o.shiftwidth = 4     -- How many whitespaces an indent level should be?
vim.o.laststatus = 2

vim.o.expandtab = true   -- Change all \t characters into spaces.
vim.o.autoindent = true
vim.o.smarttab = true
vim.o.smartindent = true -- Add or delete indent levels when needed.

vim.o.hlsearch = true    -- Set highlight on search
vim.o.wrap = false
vim.wo.number = true     -- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 1

vim.o.splitbelow = true
vim.o.splitright = true

-- Enable mouse mode
vim.o.mouse = 'a'
vim.o.scrolloff = 5
vim.o.scrollback = 100000

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.wo.signcolumn = 'number' -- Keep signcolumn on by default

-- Decreasf update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- NOTE: You should make sure your terminal supports this
-- vim.t_Co=256   --" This is may or may not needed.
-- vim.background = 'ligth'
-- vim.colorscheme = 'PaperColor'

vim.o.termguicolors = true
-- vim.cmd([[ colorscheme tokyonight-moon]])
-- vim.cmd([[ colorscheme onedark]])

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

vim.keymap.set('n', '<leader>nh', ':nohl<CR>') -- reset search highlight

-- vim.keymap.set('n', 'x', '"_x') -- when deleting character do not copy into register
vim.keymap.set({'n','v'}, 'd', '"_d') -- when in noraml deleting does not copy into register
vim.keymap.set('n', '+', '<C-a>') -- increment numbers
vim.keymap.set('n', '-', '<C-x>')

-- general keymaps
vim.keymap.set('i', 'jk', '<ESC>')  -- go to normal mode fast
-- vim.keymap.set('i', 'JK', '<ESC>')  -- go to normal mode fast

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- move lines down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv") -- move lines up

-- vim.keymap.set('n', '<C-j>', 'mzJ`z')
-- vim.keymap.set('n', '<C-d>', '<C-d>zz')
-- vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '6jzz')
vim.keymap.set('n', '<C-u>', '6kzz')
-- vim.keymap.set('n', 'J', '6jzz')
-- vim.keymap.set('n', 'K', '6kzz')

-- once something is visual, you can
-- delete it without populating registervim.k
-- vim.keymap.set('n', '<leader>p', '[["_dP]]')
-- vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

--vim.keymap.set('n', '<leader>/', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- window management splits
vim.keymap.set('n', '<leader>sv', '<C-w>v')  -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s')  -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=')  -- make splits equal width/height
vim.keymap.set('n', '<leader>sx', ':close<CR>') -- close current split window

vim.keymap.set('n', '<C-k>', '<C-w>k')  -- navigate to upper spit.
vim.keymap.set('n', '<C-l>', '<C-w>l')  -- navigate to bottom split
vim.keymap.set('n', '<C-h>', '<C-w>h')  -- navigate to left split
vim.keymap.set('n', '<C-j>', '<C-w>j')  -- navigate to right split

if vim.fn.has('macunix') then
    vim.keymap.set('n', '', '<C-w>K')   -- move split to upper spit.
    vim.keymap.set('n', 'Ò', '<C-w>L')    -- move split to bottom split
    vim.keymap.set('n', 'Ó', '<C-w>H')    -- move split to left split
    vim.keymap.set('n', 'Ô', '<C-w>J')    -- move split to right split

    vim.keymap.set('n', '˙', ':vertical resize -2<CR>') -- alt-j resize split vert
    vim.keymap.set('n', '¬', ':vertical resize +2<CR>') -- alt-k resize split vert
    vim.keymap.set('n', '˚', ':resize +2<CR>')    -- alt-h resize split horizontally
    vim.keymap.set('n', '∆', ':resize -2<CR>')   -- alt-l resize split horizontally
end
-- vim.keymap.set('n', 'Ó', ':vertical resize -1<CR>') -- resize more precision.
-- vim.keymap.set('n', 'Ò', ':vertical resize +1<CR>') -- use Shift key
-- vim.keymap.set('n', '', ':resize +1<CR>') --
-- vim.keymap.set('n', 'Ô', ':resize -1<CR>') --

-- window management tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>')   -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>') -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>')  --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>')  --  go to previous tab
vim.keymap.set('n', '<leader>1', ':1tabn<CR>')  --  go to tab 1
vim.keymap.set('n', '<leader>2', ':2tabn<CR>')  --  go to tab 2
vim.keymap.set('n', '<leader>3', ':3tabn<CR>')  --  go to tab 3
vim.keymap.set('n', '<leader>4', ':4tabn<CR>')  --  go to tab 4
vim.keymap.set('n', '<leader>5', ':5tabn<CR>')  --  go to tab 5
vim.keymap.set('n', '<leader>6', ':6tabn<CR>')  --  go to tab 6
-- vim.keymap.set('n', '<leader>7', ':7tabn<CR>') --  go to tab 7
-- vim.keymap.set('n', '<leader>8', ':8tabn<CR>') --  go to tab 8
-- vim.keymap.set('n', '<leader>9', ':9tabn<CR>') --  go to tab 8

vim.keymap.set('n', '<leader>7', '<cmd>Cmd7<CR>')
vim.keymap.set('n', '<leader>8', '<cmd>Cmd8<CR>')
vim.keymap.set('n', '<leader>9', '<cmd>Cmd9<CR>')

vim.api.nvim_create_user_command(
    'CmdPrint',
    function()
        print('command! cmd7 lua require\'toggleterm\'.exec("echo hola",1)')
    end,
    { nargs = 0 }
)
--command! cmd7 lua require'toggleterm'.exec("echo hola",1)
--
-- extra configurations in LSP file

-- Plugin Keybinds
-- vim-maximizer   -- toggle split window maximization
vim.keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>')

-- vim.keymap.set('n', 'gf', ':ClangdSwitchSourceHeader')

-- format
vim.keymap.set('n', '<leader>f', ':Format<CR>')

-- terminal related stuff
-- vim.keymap.set('n', '<F8>', ':ToggleTermSendCurrentLine<CR>')
-- vim.keymap.set('v', '<F8>', ':ToggleTermSendVisualLines<CR>')
-- vim.keymap.set('n', '<F9>', ':ToggleTermSendCurrentLine<CR>:norm j<CR>')
-- vim.keymap.set('v', '<F9>', ':ToggleTermSendVisualLines<CR>:norm j<CR>')
vim.keymap.set('v', '<leader>x', ':ToggleTermSendVisualLines<CR>')
vim.keymap.set('n', '<leader>x', ':ToggleTermSendCurrentLine<CR>')
vim.keymap.set({ 'n', 'v' }, 'X', ':ToggleTermSendCurrentLine<CR>:norm j<CR>')
-- vim.keymap.set('n', '<leader>vx', ':ToggleTermSendVisualSelection<CR>n')
vim.keymap.set('n', '<leader>tt', ':term<CR>:set nonu nornu<CR>i')
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=\'horizontal\' size=10<CR>')
-- vim.keymap.set('n', '<leader>TT', ':set nu rnu<CR>')
vim.keymap.set('t', '<C-n>', '<C-\\><C-n>')
-- vim.keymap.set('t', '<C-h>', '<C-\\><C-n> | <C-w>h | <C-w>h')
-- vim.keymap.set('t', '<C-k>', '<C-\\><C-n> | <C-w>k | <C-w>k')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n> | <C-w>h ') -- single movement when going out of terminal
vim.keymap.set('t', '<C-k>', '<C-\\><C-n> | <C-w>k ')
-- vim.keymap.set('t', '<C-l>', '<C-\\><C-n> | <C-w>l | <C-w>l')

-- save splits and tabs configuration into a session file
vim.keymap.set('n', '<leader>ss', ':mksession! .session<CR>')
vim.keymap.set('n', '<leader>sl', ':source .session<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

-- -- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.api.nvim_create_user_command(
    'SetTab',
    function()
        print('set shiftwidth=N followed by gg=G')
        -- vim.b.shiftwidth = tonumber(t)
        -- vim.cmd(':norm gg=G')
        --
        -- vim.o.tabstop = tonumber(t)
        -- vim.o.softtabstop = tonumber(t)
        -- vim.o.expandtab = true
        -- vim.cmd(':retab')
    end,
    { nargs = 0 }
)
