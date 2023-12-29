local M = { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }

--- Button element
---@param sc string
---@param txt string
---@param action string
---@return table
local function button(sc, icon, txt, action)
	local text = icon .. " " .. txt

	local btn = {
		type = "button",
		val = text,
		opts = {
			position = "center",
			text,
			shortcut = sc,
			cursor = 19,
			width = 19,
			align_shortcut = "right",
			hl_shortcut = "Number",
			hl = "Function",
			keymap = { "n", sc, action, { noremap = true, silent = true } },
		},
	}

	btn.on_press = function()
		local key = vim.api.nvim_replace_termcodes(sc, true, false, true)
		vim.api.nvim_feedkeys(key, "normal", false)
	end

	return btn
end

function M.config()
	local alpha = require("alpha")
	local lazy = require("lazy")
	local headers = require("utils.headers")

	local stats = lazy.stats()

	local header = {
		type = "text",
		val = headers:get_random(),
		opts = {
			position = "center",
			hl = "Comment",
		},
	}

	local time_appendix = ""
	if stats.startuptime > 0 then
		time_appendix = " in " .. stats.startuptime .. "ms"
	end

	local plugin_count = {
		type = "text",
		val = "󰏖  " .. stats.count .. " plugins loaded" .. time_appendix,
		opts = {
			position = "center",
			hl = "String",
		},
	}

	local buttons = {
		type = "group",
		val = {
			button("u", " ", "Update", ":Lazy update<CR>"),
			button("q", "󰗼 ", "Quit", ":qa<CR>"),
		},
		opts = {
			position = "center",
			spacing = 1,
		},
	}

	local section = {
		header = header,
		buttons = buttons,
		pluginCount = plugin_count,
	}

	alpha.setup({
		layout = {
			{ type = "padding", val = 3 },
			section.header,
			{ type = "padding", val = 3 },
			section.pluginCount,
			{ type = "padding", val = 2 },
			section.buttons,
		},
	})

	Map("n", "°", ":Alpha<CR>")
end

return { M }
