vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap(
	"i",
	"<C-j>",
	"copilot#Accept()",
	{ expr = true, noremap = true }
)
