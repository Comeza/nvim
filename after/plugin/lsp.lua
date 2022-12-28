local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.set_preferences({
    suggest_lsp_servers = true
})

lsp.ensure_installed({
    'rust_analyzer',
    'sumneko_lua'
})

lsp.use('rust_analyzer', {
    diagnostic = { experimental = { enable = true } }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = true }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "gh", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function () vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>f", function () vim.lsp.buf.format() end, opts)
end)

require'lspconfig'.sumneko_lua.setup {
    settings = { Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = {'vim'} },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = { enable = false },
    } }
}

lsp.setup()
