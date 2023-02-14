local lsp = require("lsp-zero")
local ih = require("inlay-hints")

lsp.preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
	"clangd",
	"fsautocomplete",
	"sumneko_lua",
})

lsp.configure("tsserver", {
	on_attach = function(c, b)
		ih.on_attach(c, b)
	end,
	settings = {
		javascript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
		typescript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
	},
})

lsp.configure("rust_analyzer", {
	tools = {
		on_initialized = function()
			ih.set_all()
		end,
		inlay_hints = {
			auto = false,
		},
	},
	server = {
		on_attach = function(c, b)
			ih.on_attach(c, b)
		end,
	},
})

lsp.setup({
	eol = {
		right_align = true,
	},
})

ih.setup()
vim.lsp.set_log_level("debug")
