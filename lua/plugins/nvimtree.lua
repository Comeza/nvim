return {
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup()
            local actions = require("nvim-tree.actions")
            local api = require("nvim-tree.api")

            Map("n", "<leader>to", api.tree.open)
            Map("n", "<leader>tc", api.tree.close)
        end
    }
}
