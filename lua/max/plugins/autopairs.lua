return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		check_ts = true,
		ts_config = {
			lua = { "string" },
			javascript = { "template_string" },
			java = false,
		},
		map_c_w = true,
		map_c_h = true,
	},
}
