return {
    { "aktersnurra/no-clown-fiesta.nvim", priority = 1000 },
    { "rose-pine/neovim",                 name = "rose-pine", config = function() vim.cmd.colorscheme('rose-pine-main') end },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true }
}
