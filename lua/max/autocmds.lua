local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local group = augroup("custom_autocommands", {})

-- Not needed when using 'yanky' plugin
autocmd("TextYankPost", {
	desc = "Highlight on yank",
	group = group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			priority = vim.highlight.priorities.user + 1,
			timeout = 70,
		})
	end,
})

-- autocmd({ "BufWritePre" }, {
-- 	desc = "Remove trailing white spaces on save",
-- 	group = group,
-- 	pattern = "*",
-- 	command = [[%s/\s\+$//e]],
-- })

autocmd("FileType", {
	desc = "Close some filetypes with <q>",
	group = group,
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"spectre_panel",
		"grug-far",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

autocmd("RecordingEnter", {
	desc = "Fix hidden macro recording when `cmdheight = 0`",
	group = group,
	pattern = "*",
	callback = function()
		vim.opt.cmdheight = 1
	end,
})

autocmd("RecordingLeave", {
	desc = "Fix hidden macro recording when `cmdheight = 0`",
	group = group,
	pattern = "*",
	callback = function()
		vim.opt.cmdheight = 0
	end,
})

-- Define `filtype=conf` to dotenv files
autocmd({ "BufEnter", "BufNewFile" }, {
	pattern = ".env*",
	command = "set filetype=conf",
})
