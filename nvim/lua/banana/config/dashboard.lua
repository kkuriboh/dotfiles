-- local home = os.getenv("HOME")

local header = {
	"",
	"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿",
	"⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⢀⣠⡤⠤⢭⣛⡉⢀⡤⠴⠶⠶⡶⢆⣉⠙⠻⢿⣿⣿",
	"⣿⣿⣿⣿⣿⡿⠋⠀⠠⠞⠉⢀⣀⡤⣤⣤⣭⠭⣤⡤⣽⣿⢿⠿⠛⠛⠳⣌⢻⣿",
	"⣿⣿⣿⣿⢿⡅⠀⠀⠀⠀⣶⠿⠛⠉⣡⠤⠭⠭⠷⡔⠚⠛⠉⠉⠉⢛⢛⢏⣿⣿",
	"⣿⣿⣿⠃⠘⠇⠀⠀⠀⠀⠈⣿⠉⠁⢒⣒⣶⠶⡦⠒⠒⠒⠚⠓⠛⠉⡿⣿⣿⣿",
	"⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⣟⠀⢉⣉⣠⣤⣤⢶⣒⣠⣭⣭⣭⣭⣉⡗⣼⣿⣿",
	"⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠀⠛⠿⠭⠶⠖⠛⠉⠀⠈⠁⠈⠉⠛⢣⣿⣿⣿",
	"⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿",
	"⣿⡏⣶⣦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣤⣤⣶⣿⣿⣜⠿⣿⣿",
	"⣿⢣⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡝⣿",
	"",
}

--[[db.custom_header = {
	"",
	"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣻⣿⡿⣫⣿⣿⠟⠁⠀⣼⠁⠀⠈⣿⣿⢿",
	"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣾⢟⣩⣾⠿⠋⠁⠀⢠⣴⣧⣤⣤⣤⣿⡏⠈",
	"⣿⣿⢿⣿⣿⡿⠟⠽⠛⠉⠀⠚⠉⠚⠋⠉⠀⠀⠀⠤⠒⠉⠀⠀⠀⠀⢀⡿⠉⠂",
	"⣿⠏⢸⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀",
	"⣿⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⡀⠀⠀⠀⠀",
	"⡇⠀⣀⣤⣤⣤⣴⣶⣶⣶⣶⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣶⣶⣤⣤⣤⣀",
	"⣩⣿⡿⠟⣿⣿⣿⣿⣿⣯⠙⠳⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣯⠙⠻⢿",
	"⠹⣿⠀⠀⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⠀⠀⢈",
	"⡀⠈⠂⡀⣙⢩⢿⡿⠝⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠻⣿⠃⠀⢀⡘",
	"⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠉⠉⠉⠉⠁⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢷⣶⣶⠶⠟⠋⠙⢶⣤⣴⠄⠀⠀⠀⠀⠀⠀",
	"⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼",
	"⣮⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿",
	"",
}]]

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				header = header,
			},
		})
	end,
})
