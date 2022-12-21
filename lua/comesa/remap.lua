vim.g.mapleader = " "

local opts = { remap = true }

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)

vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv", opts)
vim.keymap.set("n", "<leader>f", "gg=G``w", opts)

vim.keymap.set("n", "bd", "<cmd>bd<CR>", opts)
vim.keymap.set("n", "bp", "<cmd>bp<CR>", opts)
vim.keymap.set("n", "bn", "<cmd>bn<CR>", opts)
