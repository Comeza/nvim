local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.set_preferences({
    suggest_lsp_servers = true
})

lsp.use('rust_analyzer', {
    diagnostic = { experimental = { enable = true } }
})


local cmp = require('cmp')
local cmp_action = lsp.cmp_action();
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>']  = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    })
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = true }

    Kmap("n", "gd", function() vim.lsp.buf.definition() end, opts) -- g (d)efinition
    Kmap("n", "gi", function() vim.lsp.buf.signature_help() end, opts) -- g signature(i)nfo
    Kmap("n", "ga", function() vim.lsp.buf.code_action() end, opts) -- g (a)ction
    Kmap("n", "gh", function() vim.diagnostic.open_float() end, opts) -- g (h)elp
    Kmap("n", "gd", function() vim.lsp.buf.definition() end, opts) -- g (d)efinition
    Kmap("n", "gD", function() vim.lsp.buf.declaration() end, opts) -- g (D)claration
    Kmap("n", "<A-F>", function() vim.lsp.buf.format() end, opts) -- (f)ormat
    Kmap("n", "<leader>f", function() vim.lsp.buf.format() end, opts) -- (f)ormat
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp.default_setup,
  }
})

-- Sometimes this is needed that the lsp can resolve the 'vim' global variable
-- If this doesn't work, you might need to update neovim.
-- In case if you're using Arch, you might want to use `neovim-git` (AUR) instead of `neovim`.
-- It also helps to run `:so %` on this file sometimes. Idk why
-- Maybe it's the out-dated LuaJIT version, some environmet magic or just some lsp mischief.

-- require 'lspconfig'.sumneko_lua
require 'lspconfig'.lua_ls
    .setup {
        settings = { Lua = {
            runtime = { version = 'LuaJIT' }, -- Should techinically be auto-detected. Sometimes this needs to be commented out.
            diagnostics = { globals = { 'vim' } },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
        } }
    }

lsp.setup()
