local headers_dir = vim.fn.stdpath("config") .. "/headers"

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
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end


function M:get_random()
    local item = self.paths[math.random(#self.paths)]
    return vim.split(read_file(item), '\n')
end

return M

