return {
    'nvim-telescope/telescope.nvim',

    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        local builtin = require 'telescope.builtin';

        local colorscheme = function()
            builtin.colorscheme({ enable_preview = true })
        end

        Map("n", "<leader>ö",  builtin.fd)
        Map("n", "<leader>ä",  builtin.git_files)
        Map("n", "<leader>b",  builtin.buffers)
        Map("n", "<leader>?",  builtin.keymaps)
        Map("n", "<leader>m",  builtin.marks)
        Map("n", "<leader>p",  builtin.commands)
        Map('n', '<leader>uC', colorscheme)

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
