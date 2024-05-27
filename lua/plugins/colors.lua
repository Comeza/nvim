local function colorscheme(github, name)
    return {
        github,
        name,
        priority = 1000
    }
end

return {
    colorscheme("aktersnurra/no-clown-fiesta.nvim"),
    colorscheme("rose-pine/neovim", "rose-pine"),
    colorscheme("ellisonleao/gruvbox.nvim"),
    colorscheme("rebelot/kanagawa.nvim"),
    colorscheme("comfysage/evergarden"),
}
