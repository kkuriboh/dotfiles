vim.cmd.colorscheme("tokyonight-night")
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
vim.o.laststatus = 3
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.splitright = true
vim.opt.expandtab = false
vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.g.mapleader = " "
vim.g.did_load_filetypes = 1
vim.g.rust_recommended_style = 0

if vim.g.neovide or vim.g.goneovim then
	-- vim.opt.guifont = "VictorMono Nerd Font Mono:h8"
	-- vim.opt.guifont = "CaskaydiaCove Nerd Font Mono:h8.5"
	-- vim.opt.guifont = "scientifica Nerd Font:h16"
	vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h9"
	-- vim.opt.guifont = "JuliaMono:h9"
	vim.opt.expandtab = false
	vim.g.neovide_cursor_vfx_mode = "torpedo"
	vim.g.neovide_cursor_antialiasing = true
else
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local some_group = vim.api.nvim_create_augroup("idk", { clear = true })

vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ command = "FormatWrite", group = some_group }
)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "fsharp",
	callback = function()
		vim.opt.expandtab = true
	end,
	group = some_group,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dart",
	callback = function()
		vim.opt.shiftwidth = 2
		vim.opt.softtabstop = 2
		vim.opt.tabstop = 2
	end,
	group = some_group,
})
-- vim.cmd.hi("Normal guibg=NONE ctermbg=NONE")
-- vim.cmd.hi("NonText guibg=NONE ctermbg=NONE")
