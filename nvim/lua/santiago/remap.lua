local Remap = require("santiago.keymap")
local nnoremap = Remap.nnoremap

-- Save file
nnoremap("<leader>fs", "<cmd>w<CR>")

-- Open file explorer
nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- Map U to Redo
nnoremap("U", "<C-r>")

-- Open terminal with shortcut
nnoremap("<leader>;", "<Cmd>terminal<CR>")

-- Move between windows
nnoremap("<leader>wl", "<C-w>l")
nnoremap("<leader>wh", "<C-w>h")
nnoremap("<leader>wk", "<C-w>k")
nnoremap("<leader>wj", "<C-w>j")
-- Swap position with windwon N (default: next window)
nnoremap("<leader>wx", "<C-w>x")

-- LSP
nnoremap("gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
nnoremap("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
nnoremap("gt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>")
nnoremap("gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
nnoremap("gf", "<Cmd>lua vim.lsp.buf.references()<CR>")
nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- Format code
nnoremap("<C-I>", "<Cmd>lua vim.lsp.buf.format()<CR>")
