return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▏" },
			change = { text = "▏" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▏" },
			untracked = { text = "▏" },
		},
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

			-- map("n", "]g", gs.next_hunk, "Next Hunk")
			-- map("n", "[g", gs.prev_hunk, "Prev Hunk")
			map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
			map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
			map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
			map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
			map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
			map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
			map("n", "<leader>gd", gs.diffthis, "Diff This")
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			map("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, "Blame Line")
			map("n", "<leader>gD", function()
				gs.diffthis("~")
			end, "Diff This ~")
		end,
	},
}
