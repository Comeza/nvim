return {
    'nvim-telescope/telescope.nvim',

    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        local builtin = require 'telescope.builtin';

        map("n", "<leader>ö", builtin.fd)
        map("n", "<leader>ä", builtin.git_files)
        map("n", "<leader>b", builtin.buffers)
        map("n", "<leader>?", builtin.keymaps)
        map("n", "<leader>m", builtin.marks)
        map("n", "<leader>p", builtin.commands)
        
        -- This is your opts table
        require("telescope").setup {
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "target",
                    "dist"
                }
            }
        }
    end
}
