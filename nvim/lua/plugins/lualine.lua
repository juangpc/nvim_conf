local status, lualine = pcall(require, 'lualine')
if not status then
    print("Problem with Lualine plugin.")
    return
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'OceanicNext',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = {
            {
                'mode',
                --color = { fg = '#73b8f1', bg = '#3b3f4c'},
                color = { fg = '#3d4046' },
                -- color = { bg = '#35435B', fg = '#8c929e',},
            },
        },
        lualine_b = {
            { 'branch',      color = { fg = '#a4aab6' }, },
            { 'diff',        color = { fg = '#8c929e' }, },
            { 'diagnostics', color = { fg = '#8c929e' }, },
        },
        lualine_c = {
            {
                'filename',
                shorting_target = 10,
                path = 1, -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory
                -- 4: Filename and parent dir, with tilde as the home directory
                symbols = {
                    modified = '●',      -- Text to show when the buffer is modified
                    alternate_file = '#',  -- Text to show to identify the alternate file
                    directory = '',     -- Text to show when the buffer is a directory
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    newfile = '[New]',     -- Text to show for newly created file before first write
                },
                color = { fg = '#8c929e', bg = '#3b3f4c' },
                --color = { fg = '#206c7f', bg = 'grey' }
                --color = { fg = '#ffaa88', bg = 'grey', gui='italic,bold' }
            },
        },
        lualine_x = {
            -- { 'encoding',   color = { fg = '#8c929e' }, },
            { 'fileformat', color = { fg = '#8c929e' }, },
            { 'filetype',   color = { fg = '#8c929e' }, },
        },
        lualine_y = { { 'progress', color = { fg = '#a4aab6' }, }, },
        lualine_z = { { 'location', color = { fg = '#3d4046' }, }, },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {
            {
                'filename',
                padding = 3,
                file_status = true,     -- Displays file status (readonly status, modified status)
                newfile_status = false, -- Display new file status (new file means no write after created)
                path = 3,               -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory
                -- 4: Filename and parent dir, with tilde as the home directory

                shorting_target = 10, -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                symbols = {
                    modified = ' ●',     -- Text to show when the buffer is modified
                    alternate_file = '#',  -- Text to show to identify the alternate file
                    directory = '',     -- Text to show when the buffer is a directory
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    newfile = '[New]',     -- Text to show for newly created file before first write
                },
                --color = { fg = '#abb2bf'},
                color = { fg = '#8c929e' },
            }
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
            {
                'location',
                color = { fg = '#8c929e' },
            },
        },
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { 'nvim-tree' }
}
