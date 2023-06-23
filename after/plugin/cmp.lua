-- Make icons monochrome
require 'nvim-web-devicons'.setup({
    color_icons = false,
    default     = true
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.setup {
    view = {
        entries = { name = 'custom' }
    },
}
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
