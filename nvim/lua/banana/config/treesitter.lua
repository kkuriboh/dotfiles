require('nvim-treesitter.configs').setup{
	ensure_installed = { "c", "cpp", "lua", "rust", "typescript", "tsx" },

	highlight = {
		enable = true
	},
	indent = {
		enable = true
	},
	autotag = {
		enable = true
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {
			--[["#ff7a93",
			"#b9f27c",
			"#ff9e64",
			"#7da6ff",
			"#bb9af7",
			"#0db9d7",
			"#acb0d0"
			"#6e6c7e",]]
			"#f28fad",
			"#abe9b3",
			"#fae3b0",
			"#96cdfb",
			"#f5c2e7",
			"#89dceb",
			"#d9e0ee"
		}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	}
}
