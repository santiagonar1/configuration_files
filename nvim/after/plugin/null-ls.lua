local formatting = require("null-ls").builtins.formatting
require("null-ls").setup({
	sources = {
		formatting.rustfmt,
		formatting.clang_format,
		formatting.prettier,
		formatting.black,
		formatting.shfmt,
		formatting.latexindent,
		formatting.stylua,
	},
})
