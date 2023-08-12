if not vim.g.neovide then return end

print("detected neovide environment")

vim.opt.clipboard = "unnamedplus"

vim.opt.guifont = { "CaskaydiaCove Nerd Font", "h18" }
-- vim.opt.guifont = { "JetBrains NerdFont", "h18" }
vim.g.neovide_scale_factor = 0.8

local SCALE_FACTOR = 0.1

Kmap({ "n", "i" }, "<F11>", function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end)

-- dynamic scaling
Kmap({ "n", "i" }, "<C-+>", function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + SCALE_FACTOR end)
Kmap({ "n", "i" }, "<C-->", function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - SCALE_FACTOR end)
Kmap({ "n", "i" }, "<C-0>", function() vim.g.neovide_scale_factor = 1 end)
