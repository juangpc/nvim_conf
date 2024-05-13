
-- local nightfly = require("lualine.themes.nightfly")
local status, zenmode = pcall(require,'zen-mode')
if not status then
     return
end

zenmode.setup {
     window = {
         width = 120,
         options = {
             number = true,
             relativenumber = true,
         }
     },
}

vim.keymap.set("n", "<leader>Z", function()
     require("zen-mode").toggle()
     vim.wo.wrap = false
     -- vim.cmd [[colorscheme nightfly]]

     -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
     -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end)

