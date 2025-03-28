-- colorizer
return {
	"brenoprata10/nvim-highlight-colors",
	event = "BufReadPre",
	opts = {
		---Render style
		---@usage 'background'|'foreground'|'virtual'
		render = "background",

		enable_hex = true, -- Highlight hex colors, e.g. '#FFFFFF'
		enable_short_hex = true, -- Highlight short hex colors e.g. '#fff'
		enable_rgb = true, -- Highlight rgb colors, e.g. 'rgb(0 0 0)'
		enable_hsl = true, -- Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
		enable_hsl_without_function = true, -- Highlight hsl colors without function, e.g. '--foreground: 0 69% 69%;'
		enable_named_colors = true, --Highlight named colors, e.g. 'green'
		enable_var_usage = true, -- Highlight CSS variables, e.g. 'var(--testing-color)'
		enable_ansi = false, -- Highlight ansi colors, e.g '\033[0;34m'
		enable_tailwind = true, -- Highlight tailwind colors, e.g. 'bg-blue-500'

		-- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
		exclude_filetypes = { "lazy", "typescript", "javascript" },
		exclude_buftypes = { "prompt", "nofile" },
	},
}
