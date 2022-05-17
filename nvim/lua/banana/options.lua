vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = "night"
vim.o.background = "dark"
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
vim.o.laststatus = 3
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.splitright = true
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.g.mapleader = " "
vim.g.did_load_filetypes = 1

if vim.g.neovide or
	vim.g.goneovim then
	vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h7.5"
	vim.g.neovide_cursor_vfx_mode = "torpedo"
	vim.g.neovide_cursor_antialiasing = true
end
