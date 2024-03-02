-- LEADER KEYS ARE DEFINED IN init.lua, since lazy.nvim requires it to be set before it's loaded
--
--
local opts = { remap = true, silent = true, }

--- Wrappers around [vim.keymap.set]
---@param mode string|table
---@param map string|table
---@param thing string|function
---@param options table|nil
function Map(mode, map, thing, options)
    local o = options or opts

    if type(map) == 'table' then
        for item in pairs(map) do
            vim.keymap.set(mode, item, thing, o)
        end
    end

    if type(map) == 'string' then
        vim.keymap.set(mode, map, thing, o)
    end
end

-- go into normal mode with jj
Map('i', 'jj', '<Esc>')

-- save file
Map('n', '<leader>w', ':w<CR>')

-- move lines
Map('v', 'J', ':m \'>+1<CR>gv=gv')
Map('v', 'K', ':m \'<-2<CR>gv=gv')

Map('i', '<A-j>', '<Down>')
Map('i', '<A-k>', '<Up>')
Map('i', '<A-h>', '<Left>')
Map('i', '<A-l>', '<Right>')

-- buffer keys
Map('n', 'bd', '<cmd>bd<CR>')
Map('n', 'bp', '<cmd>bp<CR>')
Map('n', 'bn', '<cmd>bn<CR>')

-- open note-taking buffer
Map('n', '<leader>ß', ':noswapfile enew<CR>:setlocal buftype=nofile<CR>:setlocal bufhidden=hide<CR>file scratch<CR>')

-- (Re)center cursor
Map('n', 'zz', function()
    vim.o.scrolloff = vim.o.scrolloff == 999 and 0 or 999
end)


-- LSP keybinds
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local o = { remap = true, silent = true, buffer = args.buf }

        Map("n", "K", vim.lsp.buf.hover, o)           -- Hover
        Map("n", "gd", vim.lsp.buf.definition, o)     -- g (d)efenition
        Map("n", "gD", vim.lsp.buf.declaration, o)    -- g (D)eclaration
        Map("n", "gi", vim.lsp.buf.signature_help, o) -- g signature (i)nfo
        Map("n", "gu", vim.lsp.buf.references, o)     -- g (u)sages
        Map("n", "ga", vim.lsp.buf.code_action, o)    -- g (a)ction
        Map("n", "gh", vim.diagnostic.open_float, o)  -- g (h)elp
        Map("n", "<M-F>", vim.lsp.buf.format, o)      -- (f)ormat
        Map("n", "<leader>f", vim.lsp.buf.format, o)  -- (f)ormat
        Map("n", "<F2>", vim.lsp.buf.rename, o)
    end,
})


-- OTHER
Map('n', "<leader>Z", ":ZenMode<CR>")
