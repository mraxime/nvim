-- Autocompletion
return {
	"saghen/blink.cmp",
	build = "cargo build --release",
	version = false,
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = {
				"lazydev",
				"lsp",
				"path",
				-- "snippets",
				-- "buffer",
			},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
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
