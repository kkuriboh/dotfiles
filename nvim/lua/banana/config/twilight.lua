require("twilight").setup({
	dimming = {
		alpha = 0.50,
		color = { "Normal", "#ffffff" },
		inactive = true,
	},
	context = 8,
	treesitter = true,
	expand = {
		"function",
		"method",
		"table",
		"if_statement",
		"struct",
	},
	exclude = {},
})
