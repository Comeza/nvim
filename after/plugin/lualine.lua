require('lualine').setup {
    options = {
        globalstatus = true,
    },
    sections = {
        lualine_c = {
            'lsp_progress'
        }
    }
}
