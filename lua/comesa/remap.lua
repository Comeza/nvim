vim.g.mapleader = " "

local opts = { remap = true, silent = true }

-- go into normal mode with jj
vim.keymap.set("i", "jj", "<Esc>", opts)

-- open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)

-- save file
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- (re)format code
-- vim.keymap.set("n", "<leader>f", "gg=G``w", opts)

-- buffer keys
vim.keymap.set("n", "bd", "<cmd>bd<CR>", opts)
vim.keymap.set("n", "bp", "<cmd>bp<CR>", opts)
vim.keymap.set("n", "bn", "<cmd>bn<CR>", opts)

-- open undotree (maybe move into after-directory
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", opts)

-- open note-taking buffer
vim.keymap.set("n", "<leader>ß", ":noswapfile enew<CR>:setlocal buftype=nofile<CR>:setlocal bufhidden=hide<CR>file scratch<CR>", opts)
