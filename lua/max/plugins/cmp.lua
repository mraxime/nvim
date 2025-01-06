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
			list = { selection = "auto_insert" },
			accept = { auto_brackets = { enabled = true } },
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
-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	dependencies = {
-- 		-- Sources
-- 		{ "hrsh7th/cmp-nvim-lsp" },
-- 		{ "hrsh7th/cmp-path" },
-- 	},
-- 	config = function()
-- 		local cmp = require("cmp")
-- 		local max_width = 30
-- 		local ellipsis_char = "..."
--
-- 		local icons_map = {
-- 			Text = "󰉿",
-- 			Method = "󰆧",
-- 			Function = "󰊕",
-- 			Constructor = "",
-- 			Field = "󰜢",
-- 			Variable = "󰀫",
-- 			Class = "󰠱",
-- 			Interface = "",
-- 			Module = "",
-- 			Property = "󰜢",
-- 			Unit = "󰑭",
-- 			Value = "󰎠",
-- 			Enum = "",
-- 			Keyword = "󰌋",
-- 			Snippet = "",
-- 			Color = "󰏘",
-- 			File = "󰈙",
-- 			Reference = "󰈇",
-- 			Folder = "󰉋",
-- 			EnumMember = "",
-- 			Constant = "󰏿",
-- 			Struct = "󰙅",
-- 			Event = "",
-- 			Operator = "󰆕",
-- 			TypeParameter = "",
-- 		}
--
-- 		local cmp_mapping = cmp.mapping.preset.insert({
-- 			["<C-Space>"] = cmp.mapping.complete(),
-- 			["<CR>"] = cmp.mapping.confirm({ select = false }),
-- 			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Replace }),
-- 			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Replace }),
-- 			["<C-u>"] = cmp.mapping.scroll_docs(-4),
-- 			["<C-d>"] = cmp.mapping.scroll_docs(4),
-- 			["<C-e>"] = cmp.mapping.abort(), -- close completion window
-- 		})
--
-- 		local cmp_sources = cmp.config.sources({
-- 			{ name = "nvim_lsp" },
-- 			{ name = "path" },
-- 		})
--
-- 		-- Init cmp
-- 		cmp.setup({
-- 			preselect = cmp.PreselectMode.None,
-- 			mapping = cmp_mapping,
-- 			sources = cmp_sources,
-- 			completion = {
-- 				completeopt = "menu,menuone,preview,noselect",
-- 			},
-- 			window = {
-- 				completion = cmp.config.window.bordered(),
-- 				documentation = cmp.config.window.bordered(),
-- 			},
-- 			formatting = {
-- 				fields = { "abbr", "kind", "menu" },
-- 				format = function(entry, item)
-- 					-- avoids too large menu
-- 					if vim.fn.strchars(item.abbr) > max_width then
-- 						item.abbr = vim.fn.strcharpart(item.abbr, 0, max_width) .. ellipsis_char
-- 					end
--
-- 					-- add kind icon
-- 					local icon = icons_map[item.kind] or ""
-- 					item.kind = string.format("%s %s", icon, item.kind)
--
-- 					return item
-- 				end,
-- 			},
-- 		})
-- 	end,
-- }
