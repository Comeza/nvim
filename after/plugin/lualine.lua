if vim.g.is_bootstrap == true then
    print("Skipping lualine Config")
    return
end

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
