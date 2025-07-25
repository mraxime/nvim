return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	-- dependencies = {
	-- 	"hrsh7th/nvim-cmp",
	-- },
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true, -- enable treesitter
			ts_config = {
				lua = { "string" }, -- don't add pairs in lua string treesitter nodes
				javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
				java = false, -- don't check treesitter on java
			},
			map_c_w = true,
			map_c_h = true,
		})

		-- local cmp = require("cmp")
		-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		--
		-- -- make autopairs and completion work together
		-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
