return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},

	config = function()
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")

		local colorscheme = function()
			builtin.colorscheme({ enable_preview = true })
		end

		Map("n", "<leader>ö", builtin.fd)
		Map("n", "<leader>ä", builtin.live_grep)
		Map("n", "<leader>b", builtin.buffers)
		Map("n", "<leader>?", builtin.keymaps)
		Map("n", "<leader>m", builtin.marks)
		Map("n", "<leader>p", builtin.commands)
		Map("n", "<leader>uC", colorscheme)

		-- This is your opts table
		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"target",
					"dist",
				},
			},
		})

		telescope.load_extension("ui-select")
	end,
}
