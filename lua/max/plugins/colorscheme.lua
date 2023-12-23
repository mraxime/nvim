local transparent_active = false
return {
	{
		"folke/tokyonight.nvim",
		enabled = true,
		priority = 1000,
		opts = {
			style = "night",
			transparent = transparent_active,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			sidebars = {
				"qf",
				"vista_kind",
				"terminal",
				"spectre_panel",
				"startuptime",
				"Outline",
			},
			-- on_colors = function(colors)
			-- 	local bg = "#011628"
			-- 	local bg_dark = "#011423"
			-- 	local bg_highlight = "#143652"
			-- 	local bg_search = "#0A64AC"
			-- 	local bg_visual = "#275378"
			-- 	local fg = "#CBE0F0"
			-- 	local fg_dark = "#B4D0E9"
			-- 	local fg_gutter = "#627E97"
			-- 	local border = "#547998"
			-- 	colors.bg = bg
			-- 	colors.bg_dark = bg_dark
			-- 	colors.bg_float = bg_dark
			-- 	colors.bg_highlight = bg_highlight
			-- 	colors.bg_popup = bg_dark
			-- 	colors.bg_search = bg_search
			-- 	colors.bg_sidebar = bg_dark
			-- 	colors.bg_statusline = bg_dark
			-- 	colors.bg_visual = bg_visual
			-- 	colors.border = border
			-- 	colors.fg = fg
			-- 	colors.fg_dark = fg_dark
			-- 	colors.fg_float = fg
			-- 	colors.fg_gutter = fg_gutter
			-- 	colors.fg_sidebar = fg_dark
			-- end,
			on_highlights = function(hl, c)
				hl.FloatBorder = { fg = c.fg_gutter }
				hl.FloatTitle = { fg = c.orange }
				hl.FloatFooter = { fg = c.orange }
				hl.CursorLineNr = { fg = c.orange, bold = true }
				-- hl.LineNr = { fg = c.orange, bold = true }
				hl.FloatBorder = { fg = c.fg_gutter }
				hl.LineNrBelow = { fg = c.fg_gutter }
				-- local prompt = "#2d3149"
				-- hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
				hl.TelescopeBorder = { fg = c.fg_gutter }
				-- hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
				-- hl.TelescopePromptNormal = { bg = prompt }
				-- hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
				hl.TelescopePromptTitle = { fg = c.orange }
				hl.TelescopePreviewTitle = { fg = c.orange }
				hl.TelescopeResultsTitle = { fg = c.orange }
			end,
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		priority = 1000,
		opts = {
			contrast = "hard",
			transparent_mode = transparent_active,
			overrides = {
				CursorLineNr = { bg = "" },
				DiffDelete = { reverse = false },
				DiffAdd = { reverse = false },
				DiffChange = { reverse = false },
				DiffText = { reverse = false },
				IndentContext1 = { link = "GruvboxRed" },
				IndentContext2 = { link = "GruvboxOrange" },
				IndentContext3 = { link = "GruvboxYellow" },
				IndentContext4 = { link = "GruvboxGreen" },
				IndentContext5 = { link = "GruvboxAqua" },
				IndentContext6 = { link = "GruvboxBlue" },
				IndentContext7 = { link = "GruvboxViolet" },

				-- See: https://github.com/ellisonleao/gruvbox.nvim/pull/255
				["@lsp.type.class"] = { link = "@type" },
				["@lsp.type.decorator"] = { link = "@macro" },
				["@lsp.type.interface"] = { link = "@constructor" },
				["@lsp.type.struct"] = { link = "@type" },
			},
		},
	},

	-- { "shaunsingh/oxocarbon.nvim" },
	-- { "rose-pine/neovim", name = "rose-pine" },
}
