local Remap = require("santiago.keymap")
local nnoremap = Remap.nnoremap

require("nvim-tree").setup({
	filters = { custom = { "^.git$" } },
})

nnoremap("<leader>tt", "<cmd>NvimTreeToggle<CR>")
nnoremap("<leader>tf", "<cmd>NvimTreeFocus<CR>")
nnoremap("<leader>tr", "<cmd>NvimTreeRefresh<CR>")
