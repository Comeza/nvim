require('lualine').setup {
    options = {
        globalstatus = true,
    },
    sections = {
        lualine_c = {
            {
                'lsp_progress',
                display_components = { 'spinner', 'lsp_client_name' },
                spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
                separators = {
                    component = ' ',
                    percentage = { pre = '', post = '%% ' },
                    lsp_client_name = { pre = '', post = '' },
                    spinner = { pre = '', post = '' },
                },
            }
        }
    }
}
