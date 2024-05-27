local icons = require 'config.icons'

return {
    "folke/trouble.nvim",

    dependencies = {
        'nvim-tree/nvim-web-devicons',
        "neovim/nvim-lspconfig",
    },

    cmd = { "Trouble", "TroubleToggle" },
    opts = {
        icons = true,
        signs = {
            error = icons.diagnostics.Error,
            warning = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
            information = icons.diagnostics.Info,
            other = icons.diagnostics.Info,
        },
    },
}
