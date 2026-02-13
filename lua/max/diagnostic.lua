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
		source = true,
	},
})

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostics", remap = false })
