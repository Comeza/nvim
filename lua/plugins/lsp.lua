local icons = require("config.icons")

local servers = {
    "lua_ls",
    "rust_analyzer"
}

return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        "williamboman/mason.nvim",
        {
            "williamboman/mason-lspconfig.nvim",
            opts = {
                ensure_installed = servers,
                automatic_installation = servers
            },
            config = function(_, opts)
                local mlsp = require('mason-lspconfig')
                mlsp.setup(opts)

                mlsp.setup_handlers({
                    function(server_name)
                        if server_name == "jdtls" then
                            return
                        end

                        require("lspconfig")[server_name].setup({
                            settings = {},
                        })
                    end
                })
            end
        },

        -- Additional lua configuration, makes nvim stuff amazing!
        {
            "folke/neodev.nvim",
            opts = {},
        },

        -- Interaction between cmp and lspconfig
        "hrsh7th/cmp-nvim-lsp",
    },

    init = function()
        -- disable lsp watcher. Too slow on linux
        local ok, wf = pcall(require, "vim.lsp._watchfiles")
        if ok then
            wf._watchfunc = function()
                return function() end
            end
        end
    end,

    config = function()
        for name, icon in pairs(icons.diagnostics) do
            vim.fn.sign_define("DiagnosticSign" .. name, { text = icon, texthl = name, numhl = "" })
        end
    end
}
