local util = require("formatter.util")
local function get_buffername()
	return util.escape_path(util.get_current_buffer_file_name())
end

local function prettier()
	return {
		exe = "prettier",
		args = {
			get_buffername(),
		},
		stdin = true,
	}
end

local function clang()
	return {
		exe = "clang-format",
		args = {
			"-assume-filename",
			get_buffername(),
			"-style",
			"{IndentWidth: 4}",
		},
		stdin = true,
		try_node_modules = true,
	}
end

require("formatter").setup({
	logging = false,
	filetype = {
		javascript = {
			prettier,
		},
		typescript = {
			prettier,
		},
		typescriptreact = {
			prettier,
		},
		css = {
			prettier,
		},
		scss = {
			prettier,
		},
		html = {
			prettier,
		},
		json = {
			prettier,
		},
		yaml = {
			prettier,
		},
		graphql = {
			prettier,
		},
		rust = {
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout", "--edition=2021" },
					stdin = true,
				}
			end,
		},
		fsharp = {
			function()
				return {
					exe = "fantomas",
					args = { get_buffername(), "--out", "/dev/stdin" },
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						"--config-path " .. "$HOME/.config/stylua/stylua.toml",
						"-",
					},
					stdin = true,
				}
			end,
		},
		dart = {
			function()
				return {
					exe = "dart format",
					args = {
						get_buffername(),
						"-o show",
						"| head -n -1",
					},
					stdin = true,
				}
			end,
		},
		elixir = {
			function()
				return {
					exe = "mix",
					args = { "format", "-" },
					stdin = true,
				}
			end,
		},
		c = { clang },
		cpp = { clang },
	},
})
