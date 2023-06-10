-- Make icons monochrome
require 'nvim-web-devicons'.setup({
    color_icons = false,
    default     = true
})

local cmp = require('cmp')
cmp.setup {
    view = {
        entries = { name = 'custom' }
    },
}
