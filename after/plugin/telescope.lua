local builtin = require'telescope.builtin';

vim.keymap.set("n", "<leader>ö", ':Telescope fd<CR>')
vim.keymap.set("n", "<leader>ä", builtin.git_files)
vim.keymap.set("n", "<leader>b", builtin.buffers)
vim.keymap.set("n", "<leader>?", builtin.keymaps)
vim.keymap.set("n", "<leader>m", builtin.marks)
vim.keymap.set("n", "<leader>p", builtin.commands)

-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}

require("telescope").load_extension("ui-select")
