return {
	"folke/noice.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{ "folke/which-key.nvim", config = true },
		{ "MunifTanjim/nui.nvim" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					find = "%d+L, %d+B",
				},
				view = "mini",
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
		},
	},
}
