return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("windwp/nvim-autopairs")
	use("nvim-treesitter/nvim-treesitter")
	use("L3MON4D3/LuaSnip")
	use("mhartington/formatter.nvim")
	use("andweeb/presence.nvim")
	use("p00f/nvim-ts-rainbow")
	use("glepnir/dashboard-nvim")
	use("simrat39/rust-tools.nvim")
	use("ziglang/zig.vim")
	use("ray-x/lsp_signature.nvim")
	use("nathom/filetype.nvim")
	use("terrortylor/nvim-comment")
	use("onsails/lspkind.nvim")
	use("romgrk/barbar.nvim")
	use("windwp/nvim-ts-autotag")
	use("lewis6991/impatient.nvim")
	use("folke/twilight.nvim")
	use("folke/tokyonight.nvim")
	use("folke/trouble.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-tree.lua")
	use({
		"hrsh7th/cmp-path",
		after = "cmp-buffer",
	})
	-- lsp --
	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/nvim-cmp",
	})

	-- telescope --
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-media-files.nvim",
		},
	})
end)
