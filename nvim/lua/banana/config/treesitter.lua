require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"lua",
		"rust",
		"toml",
		"typescript",
		"tsx",
		"zig",
		"latex",
	},

	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
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
			"#d9e0ee",
		},
	},
})

local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.fsharp = "ocaml"

local ts = vim.api.nvim_create_augroup("ts_langs", { clear = true })
vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
	pattern = "*.fs,*.fsi,*.fsx,*.fsscript,*.fsl,*.fsy",
	callback = function()
		vim.opt_local.filetype = "fsharp"
	end,
	group = ts,
})
vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
	pattern = "*.fsproj",
	callback = function()
		vim.opt.filetype = "xml"
	end,
	group = ts,
})
