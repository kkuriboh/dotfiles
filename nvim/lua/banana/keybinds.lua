local map = vim.keymap.set
local nbind = function(bindlist)
	for _, binding in ipairs(bindlist) do
		map("n", binding[1], binding[2])
	end
end

nbind({
	{ "<leader>e", ":NvimTreeToggle<CR>" },
	{ "<leader>d", ":Telescope find_files<CR>" },
	{ "<leader>a", ":Telescope grep_string<CR>" },
	{ "<leader>p", ":Telescope<CR>" },
	{ "<leader>w", ":BufferClose<CR>" },
	{ "<leader>n", ":BufferNext<CR>" },
	{ "<leader>b", ":BufferPrevious<CR>" },
	{ "<C-n>", ":BufferMoveNext<CR>" },
	{ "<C-b>", ":BufferMovePrevious<CR>" },
	{ "<A-1>", ":BufferGoto 1<CR>" },
	{ "<A-2>", ":BufferGoto 2<CR>" },
	{ "<A-3>", ":BufferGoto 3<CR>" },
	{ "<A-4>", ":BufferGoto 4<CR>" },
	{ "<A-5>", ":BufferGoto 5<CR>" },
	{ "<A-6>", ":BufferGoto 6<CR>" },
	{ "<A-7>", ":BufferGoto 7<CR>" },
	{ "<A-8>", ":BufferGoto 8<CR>" },
	{ "<A-9>", ":BufferGoto 9<CR>" },
	{ "<leader>-", ":vertical resize -10<CR>" },
	{ "<leader>+", ":vertical resize +10<CR>" },
	{ "<leader>f", ":Format<CR>" },
	{ "<leader>z", ":ZenMode<CR>" },
	{ "<C-v>", ":vsplit | Telescope find_files<CR>" },
	{ "<C-s>", ":split | Telescope find_files<CR>" },
	{ "<C-t>", ":terminal<CR>" },
	{ "<C-y>", ":vsplit | terminal<CR>" },
	{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },
	{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" },
	{ "r", "<cmd>lua vim.lsp.buf.rename()<CR>" },
	{ "t", ":TroubleToggle<CR>" },
	{ "tr", ":TroubleRefresh<CR>" },
	{ "za", ":!zathura <C-r>=expand('%:r')<cr>.pdf &<cr>" },
	{ "mf", ":!touch " },
	{ "md", ":!mkdir -p " },
})
