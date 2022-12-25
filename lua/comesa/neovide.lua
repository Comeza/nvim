if not vim.g.neovide then return end

print("detected neovide environment")

vim.g.neovide_scale_factor=0.8

vim.keymap.set({"n", "i"}, "<F11>", function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end)
