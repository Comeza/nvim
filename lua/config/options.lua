local o = vim.opt

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

o.nu = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.smartindent = true

o.wrap = false

o.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath("data") .. "/undodir"
o.undofile = true

o.hlsearch = false
o.incsearch = true

o.termguicolors = true

o.scrolloff = 0
o.signcolumn = "yes"
o.isfname:append("@-@")

o.updatetime = 50
