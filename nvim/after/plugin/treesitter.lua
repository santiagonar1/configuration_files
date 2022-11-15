require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"regex",
		"rust",
		"toml",
		"vim",
		"yaml",
	},
	highlight = { enable = true },
	indent = { enable = true },
})
