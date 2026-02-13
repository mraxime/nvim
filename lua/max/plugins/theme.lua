local tokyonight = {
	"folke/tokyonight.nvim",
	enabled = true,
	priority = 1000,
	opts = {
		style = "night",
		transparent = true,
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
		end,
	},
}

local gruvbox = {
	"ellisonleao/gruvbox.nvim",
	enabled = true,
	priority = 1000,
	opts = {
		undercurl = true,
		underline = true,
		bold = false,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "hard", -- can be "hard", "soft" or empty string
		overrides = {
			SignColumn = { link = "GruvboxBg0" },
			LspReferenceRead = { bg = "#272839" },
			LspReferenceText = { link = "LspReferenceRead" },
			LspReferenceWrite = { link = "LspReferenceRead" },
		},
		dim_inactive = false,
		transparent_mode = false,
		palette_overrides = {
			-- dark0_hard = "#11111b", -- #11121d
			dark0 = "#181825",
			-- dark0_soft = "#1e1e2e",
			dark1 = "#32302f", -- cursor-line background, hover-box background, ...
			-- dark2 = "#1e1e2e", -- bottom-bar
			-- dark3 = "#313244", -- float borders
			-- dark4 = "#444b6a", -- left numbers
			light0_hard = "#f9f5d7",
			light0 = "#fbf1c7",
			light0_soft = "#f2e5bc",
			light1 = "#ebdbb2", -- text, telescope borders, ...
			light2 = "#d5c4a1",
			light3 = "#bdae93",
			light4 = "#a89984",
			bright_red = "#fb4934",
			bright_green = "#b8bb26",
			bright_yellow = "#fabd2f",
			bright_blue = "#83a598",
			bright_purple = "#d3869b",
			bright_aqua = "#8ec07c",
			bright_orange = "#fe8019",
			neutral_red = "#cc241d",
			neutral_green = "#98971a",
			neutral_yellow = "#d79921",
			neutral_blue = "#458588",
			neutral_purple = "#b16286",
			neutral_aqua = "#689d6a",
			neutral_orange = "#d65d0e",
			faded_red = "#9d0006",
			faded_green = "#79740e",
			faded_yellow = "#b57614",
			faded_blue = "#076678",
			faded_purple = "#8f3f71",
			faded_aqua = "#427b58",
			faded_orange = "#af3a03",
			gray = "#444b6a", -- comments, ...
		},
	},
}

local rose_pine = {
	"rose-pine/neovim",
	name = "rose-pine",
	enabled = true,
	priority = 1000,
	opts = {
		variant = "main",
		styles = {
			transparency = true,
		},
	},
}

local kanagawa = {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	opts = {},
}

local ayu = {
	"Shatur/neovim-ayu",
	config = function()
		require("ayu").setup({})
	end,
}

local catppuccin = {
	"catppuccin/nvim",
	enabled = true,
	lazy = false,
	priority = 1000,
	name = "catppuccin",
	opts = {
		flavour = "mocha",
		-- background = { light = "latte", dark = "mocha" },
		-- transparent_background = true,
		-- term_colors = true,
		-- color_overrides = {
		-- 	mocha = {
		-- 		base = "#181825",
		-- 	},
		-- },
		integrations = {
			blink_cmp = true,
			gitsigns = true,
			markdown = true,
			mason = true,
			snacks = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
	end,
}

-- Better gruvbox
local moonbow = {
	"arturgoms/moonbow.nvim",
	priority = 999,
}

return {
	catppuccin,
	-- tokyonight,
	-- gruvbox,
	-- ayu,
	-- moonbow,
	-- rose_pine,
	-- night_owl,
	-- kanagawa,
}
