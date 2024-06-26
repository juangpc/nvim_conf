-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then
     print("Problem with cmp load.")
     return
end

local luasnip_status, luasnip = pcall(require, 'luasnip')
if not luasnip_status then
     print("Problem with luasnip load")
     return
end

require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
     snippet = {
         expand = function(args)
             luasnip.lsp_expand(args.body)
         end,
     },
     mapping = cmp.mapping.preset.insert {
         ['<C-j>'] = cmp.mapping.select_next_item(),
         ['<C-k>'] = cmp.mapping.select_prev_item(),
         ['<C-u>'] = cmp.mapping.scroll_docs(-3),
         ['<C-d>'] = cmp.mapping.scroll_docs(3),
         ['<C-Space>'] = cmp.mapping.complete {},
         ['<Esc>'] = cmp.mapping.complete {},
         ['<CR>'] = cmp.mapping.confirm {
             behavior = cmp.ConfirmBehavior.Replace,
             select = true,
         },
         ['<Tab>'] = cmp.mapping(function(fallback)
             if cmp.visible() then
                 cmp.select_next_item()
             elseif luasnip.expand_or_locally_jumpable() then
                 luasnip.expand_or_jump()
             else
                 fallback()
             end
         end, { 'i', 's' }),
         ['<S-Tab>'] = cmp.mapping(function(fallback)
             if cmp.visible() then
                 cmp.select_prev_item()
             elseif luasnip.locally_jumpable(-1) then
                 luasnip.jump(-1)
             else
                 fallback()
             end
         end, { 'i', 's' }),
     },
     sources = cmp.config.sources({
         { name = 'nvim_lsp' },
         { name = 'luasnip' },
     }, {
         { name = 'buffer' },
     })
}

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
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

