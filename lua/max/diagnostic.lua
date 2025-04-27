vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ", -- 
			[vim.diagnostic.severity.HINT] = "󰌵 ", -- 󰠠
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.WARN] = " ", -- ▲
		},
	},
	float = {
		style = "minimal",
		border = "rounded",
		source = true,
	},
})

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostics", remap = false })

-- vim.keymap.set("n", "[d", function()
-- 	vim.diagnostic.jump({ count = -1, float = true })
-- end, { desc = "Go to previous diagnostic", remap = false })
--
-- vim.keymap.set("n", "]d", function()
-- 	vim.diagnostic.jump({ count = 1, float = true })
-- end, { desc = "Go to next diagnostic", remap = false })
