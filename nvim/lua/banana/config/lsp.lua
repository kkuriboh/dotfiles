require('nvim-lsp-installer')
.on_server_ready(function(server)
	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
																		.make_client_capabilities())
	local opts = {capabilities = capabilities}
	if server.name == "sumneko_lua" then
		opts = vim.tbl_deep_extend("force", {
			settings = {
				Lua = {
					runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
					diagnostics = {globals = {'vim'}},
					workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
					telemetry = {enable = false}
				}
			}
		}, opts)
	end
	if server.name == "rust_analyzer" then
		require('rust-tools').setup {
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		}
		server:attach_buffers()
		require('rust-tools').start_standalone_if_required()
	else
		server:setup(opts)
	end
end)
