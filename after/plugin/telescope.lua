local builtin = require 'telescope.builtin';

Kmap("n", "<leader>ö", ':Telescope fd<CR>')
Kmap("n", "<leader>ä", builtin.git_files)
Kmap("n", "<leader>b", builtin.buffers)
Kmap("n", "<leader>?", builtin.keymaps)
Kmap("n", "<leader>m", builtin.marks)
Kmap("n", "<leader>p", builtin.commands)

-- This is your opts table
require("telescope").setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    },
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "target",
            "dist"
        }
    }
}

require("telescope").load_extension("ui-select")
