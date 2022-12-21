local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.set_preferences({
    suggest_lsp_servers = true
})

lsp.ensure_installed({
	'rust_analyzer',
    'sumneko_lua'
})

lsp.configure('rust_analyzer', {
    diagnostic = { experimental = { enable = true } }
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-Space>'] = cmp.mapping.complete()
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = true }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "gh", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function () vim.diagnostic.open_float() end)
end)

lsp.setup()

