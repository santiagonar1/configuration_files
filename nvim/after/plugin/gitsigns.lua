local Remap = require("santiago.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		-- Navigation
		nnoremap("<leader>gj", function()
			if vim.wo.diff then
				return "<leader>gj"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		nnoremap("<leader>gk", function()
			if vim.wo.diff then
				return "<leader>gk"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		nnoremap("<leader>gs", "<cmd>Gitsigns stage_hunk<CR>")
		nnoremap("<leader>gr", "<cmd>Gitsigns reset_hunk<CR>")
		vnoremap("<leader>gs", "<cmd>Gitsigns stage_hunk<CR>")
		vnoremap("<leader>gr", "<cmd>Gitsigns reset_hunk<CR>")

		nnoremap("<leader>gS", gs.stage_buffer)
		nnoremap("<leader>gu", gs.undo_stage_hunk)
		nnoremap("<leader>gR", gs.reset_buffer)
		nnoremap("<leader>gp", gs.preview_hunk)
		nnoremap("<leader>gb", gs.toggle_current_line_blame)
	end,
})
