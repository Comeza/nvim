local headers_dir = vim.fn.stdpath("config") .. "/headers"

---@alias AsciiArt string[]

local function get_headers()
    local headers = {}
    local paths = vim.split(vim.fn.glob(headers_dir .. "/*"), "\n")
    for _, item in pairs(paths) do
        table.insert(headers, item)
    end
    return headers
end

local M = { paths = get_headers() }

local function read_file(file)
    local f = assert(io.open(file, "r"))
    local content = f:read("*a")
    f:close()
    return content
end

---Gets a random header ascii art
---@return AsciiArt
function M:get_random()
    local item = self.paths[math.random(#self.paths)]
    return vim.split(read_file(item), '\n')
end

return M
