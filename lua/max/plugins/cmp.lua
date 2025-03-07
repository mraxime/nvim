-- Autocompletion
return {
	"saghen/blink.cmp",
	build = "cargo build --release",
	opts = {
		keymap = { preset = "enter" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = {
				"lsp",
				"path",
				-- "snippets",
				-- "buffer",
			},
		},
		completion = {
			list = {
				selection = {
					auto_insert = true,
				},
			},
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				-- Don't show completion menu automatically in cmdline mode
				auto_show = function(ctx)
					return ctx.mode ~= "cmdline"
				end,
				-- border = "single",
			},
			-- documentation = {
			-- window = { border = "single" },
			-- },
		},

		-- Experimental signature help support
		-- signature = {
		-- 	enabled = true,
		-- 	window = { border = "single" },
		-- },
	},
}
