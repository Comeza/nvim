require 'config.options'
require 'config.keymap'
require 'config.lazy'
require 'config.neovide'

vim.cmd.colorscheme(os.getenv("NVIM_COLORSCHEME") or "habamax")
