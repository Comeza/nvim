local obsidian_path = os.getenv("OBSIDIAN_VAULT") or "~/Documents/Obsidian/"

return {
    {
        "epwalsh/obsidian.nvim",
        dependencies = { "hrsh7th/nvim-cmp" },
        event = { "BufEnter " .. obsidian_path .. "*" },
        opts = function()
            return {
                dir = obsidian_path,
                completion = {
                    nvim_cmp = true,
                }
            }
        end
    }
}
