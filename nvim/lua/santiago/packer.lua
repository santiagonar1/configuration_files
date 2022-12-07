return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Colorscheme section
	use("gruvbox-community/gruvbox")
	use("Th3Whit3Wolf/one-nvim")

	-- git integration
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- Nerdtree like
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	-- Status bar
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Commenter
	use({ "tpope/vim-commentary" })

	-- Code
	use({ "neovim/nvim-lspconfig" })
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh" })
	use({ "onsails/lspkind-nvim" })
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	-- Formatting
	use("jose-elias-alvarez/null-ls.nvim")

	use({
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
end)
