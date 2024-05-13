local status, blank_line = pcall(require, 'ibl')
if not status then
     return
end

vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"

blank_line.update { enabled = true }
blank_line.setup()

-- blank_line.setup {
--      -- for example, context is off by default, use this to turn it on
--      show_current_context = true,
--      show_current_context_start = true,
--      space_char_blanklline = ' ',
--      char = '┊',
--      show_trailing_blankline_indent = false,
-- }
