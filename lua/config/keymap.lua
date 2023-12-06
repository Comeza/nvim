vim.g.mapleader = ' '

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

-- open netrw
Map('n', '<leader>pv', vim.cmd.Ex)

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


-- LSP keybinds
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
        local o = { remap = true, silent = true, buffer = args.buf }

        Map("n", "K",          function() vim.lsp.buf.hover() end,          o)   -- Hover 
        Map("n", "gd",         function() vim.lsp.buf.definition() end,     o)   -- g (d)efenition
        Map("n", "gD",         function() vim.lsp.buf.declaration() end,    o)   -- g (D)eclaration
        Map("n", "gi",         function() vim.lsp.buf.signature_help() end, o)   -- g signature (i)nfo
        Map("n", "ga",         function() vim.lsp.buf.code_action() end,    o)   -- g (a)ction
        Map("n", "gh",         function() vim.diagnostic.open_float() end,  o)   -- g (h)elp
        Map("n", "<M-F>",      function() vim.lsp.buf.format() end,         o)   -- (f)ormat
        Map("n", "<leader>f",  function() vim.lsp.buf.format() end,         o)   -- (f)ormat
  end,
})

