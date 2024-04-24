local config_path = os.getenv("HOME") .. "/.config/obsidian/obsidian.json"
local function locate_obsidian_vaults()
    local file = io.open(config_path, "r")
    local obsidian_path

    if file ~= nil then
        local content = file:read("a")
        local obj = assert(vim.json.decode(content, { object = true }))

        for _, vault in pairs(obj.vaults) do
            if vault.open then
                obsidian_path = vault.path
            end
        end

        file:close()
    end

    return os.getenv("OBSIDIAN_VAULT") or obsidian_path
end

local vault_dir = locate_obsidian_vaults()

return {
    {
        "epwalsh/obsidian.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" },
        event = { vault_dir and ("BufEnter " .. vault_dir .. "*") },
        enabled = vault_dir ~= nil,
        opts = function()
            return {
                dir = vault_dir,
                completion = {
                    nvim_cmp = true,
                },
                workspaces = {
                    { name = "default", path = vault_dir }
                }
            }
        end
    }
}
