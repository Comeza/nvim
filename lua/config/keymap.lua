vim.g.mapleader = ' '

local opts = { remap = true, silent = true }

--- Wrappers around [vim.keymap.set]
---@param mode string|table
---@param map string|table
---@param thing string|function
---@param options table|nil
function map(mode, map, thing, options)
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
map('i', 'jj', '<Esc>')

-- open netrw
map('n', '<leader>pv', vim.cmd.Ex)

-- save file
map('n', '<leader>w', ':w<CR>')

-- move lines
map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')

map('i', '<A-j>', '<Down>')
map('i', '<A-k>', '<Up>')
map('i', '<A-h>', '<Left>')
map('i', '<A-l>', '<Right>')

-- buffer keys
map('n', 'bd', '<cmd>bd<CR>')
map('n', 'bp', '<cmd>bp<CR>')
map('n', 'bn', '<cmd>bn<CR>')

-- open note-taking buffer
map('n', '<leader>ß',
    ':noswapfile enew<CR>:setlocal buftype=nofile<CR>:setlocal bufhidden=hide<CR>file scratch<CR>')
