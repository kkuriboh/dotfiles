local lsp = require("lsp-zero")
local ih = require("inlay-hints")
local lsp_util = require("lspconfig").util

lsp.preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

lsp.ensure_installed({
	"tsserver",
	"denols",
	"rust_analyzer",
	"clangd",
	"fsautocomplete",
	"lua_ls",
})

lsp.configure("tsserver", {
	root_dir = lsp_util.root_pattern("package.json"),
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
	init_options = {
		lint = true,
	},
	single_file_support = false,
})

lsp.configure("denols", {
	root_dir = lsp_util.root_pattern("deno.json", "deno.jsonc"),
	init_options = {
		lint = true,
	},
})

lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			hint = {
				enable = true,
			},
		},
	},
})

lsp.on_attach(function(c, b)
	ih.on_attach(c, b)
end)

lsp.setup()
ih.setup()
