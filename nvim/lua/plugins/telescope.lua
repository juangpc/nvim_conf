-- [[ Configure Telescope ]]
local setup, telescope = pcall(require, 'telescope')
if not setup then
     return
end

local telescope_actions = require('telescope.actions')

-- See `:help telescope` and `:help telescope.setup()`
telescope.setup {
     defaults = {
         mappings = {
             i = {
                 ['<esc>'] = telescope_actions.close,
                 -- ['<C-u>'] = false,
                 -- ['<C-d>'] = telescope_actions.,
                 ['<C-k>'] = telescope_actions.move_selection_previous,
                 ['<C-j>'] = telescope_actions.move_selection_next,
                 ['<C-q>'] = telescope_actions.send_selected_to_qflist +
                     telescope_actions.open_qflist,
             },
         },
     },
     { file_ignore_patterns = { "external" } },
}

pcall(require('telescope').load_extension, 'fzf') -- Enable telescope fzf native, if installed

local status_telescope_builtin, telescope_builtin = pcall(require, 'telescope.builtin')
if not status_telescope_builtin then
     print('problem with telescope')
     return
end

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader><space>', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
     -- You can pass additional configuration to telescope to change theme, layout, etc.
     telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
         winblend = 10,
         previewer = false,
     })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = '[F]ind in [H]elp' })
vim.keymap.set('n', '<leader>fw', telescope_builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fs', telescope_builtin.live_grep, { desc = '[F]ind [S]tring' })
vim.keymap.set('n', '<leader>fd', telescope_builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fo', telescope_builtin.oldfiles, { desc = '[F]ind recently opened files' })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = '[F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.git_files, { desc = '[F]ind in [G]it files' })
vim.keymap.set('n', '<leader>fc', telescope_builtin.git_commits, { desc = '[F]ind in Git [C]ommits' })
vim.keymap.set('n', '<leader>ft', telescope_builtin.tags, { desc = '[F]ind [T]ags' })
vim.keymap.set('n', '<leader>fk', telescope_builtin.keymaps, { desc = '[F]ind [K]eymaps' })


