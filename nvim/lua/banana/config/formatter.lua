local function prettier()
	return {
		exe = "prettier",
		args = { vim.api.nvim_buf_get_name(0) },
		stdin = true
	}
end

require('formatter').setup({
	logging = false,
	filetype = {
		javascript = {
			prettier
		},
		typescript = {
			prettier
		},
		typescriptreact = {
			prettier
		},
		css = {
			prettier
		},
		html = {
			prettier
		},
		json = {
			prettier
		},
		rust = {
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout", "--edition=2021" },
					stdin = true
				}
			end
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						"--config-path "
						.. "$HOME/.config/stylua/stylua.toml",
						"-"
					},
					stdin = true
				}
			end
		}
	}
})
