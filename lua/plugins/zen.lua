return {
    "folke/zen-mode.nvim",

    lazy = true,
    cmd = "ZenMode",

    config = function()
        Map('n', "<leader>Z", ":ZenMode<CR>")
    end,
}
