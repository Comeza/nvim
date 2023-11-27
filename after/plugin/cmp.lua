-- Make icons monochrome
require 'nvim-web-devicons'.setup({
    color_icons = false,
    default     = true
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.setup {
    mapping = {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    },
    view = {
        entries = { name = 'custom' }
    },
}
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
