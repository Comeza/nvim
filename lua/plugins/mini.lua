return {
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		config = function()
			local pairs = require("mini.pairs")
			pairs.setup()
		end,
	},
}
