return {
    "nvim-treesitter/nvim-treesitter",

    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,

    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            ensure_installed = { "lua", "rust", "markdown", "markdown_inline", "regex" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
