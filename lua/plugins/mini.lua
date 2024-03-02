return {
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
        enabled = false,
		config = function()
			local pairs = require("mini.pairs")
			pairs.setup()
		end,
	},
}
