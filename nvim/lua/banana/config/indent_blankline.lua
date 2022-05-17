vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#f7768e gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#e0af68 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#449dab gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#7aa2f7 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#ad8ee6 gui=nocombine]]

vim.cmd([[
hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFFFF
let g:indentLine_fileTypeExclude = ['dashboard']
]])


require("indent_blankline").setup {
	show_end_of_line = true,
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
}