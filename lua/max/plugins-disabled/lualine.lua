return {
	{
		-- "tamighi/lualine.nvim", -- fork with harpoon_files plugin
		"nvim-lualine/lualine.nvim",
		enabled = true,
		event = "VeryLazy",
		dependencies = {
			{
				"letieu/harpoon-lualine",
				dependencies = {
					{
						"ThePrimeagen/harpoon",
						branch = "harpoon2",
					},
				},
			},
		},
		config = function()
			-- local hp_marks = require("harpoon.mark")
			-- local devicons = require("nvim-web-devicons")
			--
			-- function Harpoon_files()
			-- 	local contents = {}
			--
			-- 	for idx = 1, hp_marks.get_length() do
			-- 		local file_path = hp_marks.get_marked_file_name(idx)
			-- 		local file_name
			-- 		if file_path == "" then
			-- 			file_name = "(empty)"
			-- 		else
			-- 			file_name = vim.fn.fnamemodify(file_path, ":t")
			-- 		end
			-- 		local dev, _ = devicons.get_icon(file_name)
			--
			-- 		local current_file_path = vim.fn.expand("%:f")
			--
			-- 		local prev = ""
			-- 		if idx ~= 1 then
			-- 			prev = " "
			-- 		end
			-- 		local next = ""
			-- 		if idx < hp_marks.get_length() then
			-- 			next = " "
			-- 		end
			-- 		if file_path == current_file_path then
			-- 			contents[idx] = string.format("%%#lualine_b_normal#%s%s %s%s", prev, dev, file_name, next)
			-- 		else
			-- 			contents[idx] = string.format("%%#lualine_b_inactive#%s%s %s%s", prev, dev, file_name, next)
			-- 		end
			-- 	end
			--
			-- 	return table.concat(contents)
			-- end

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_c = { "harpoon2" },
				},
				inactive_sections = {},
				-- tabline = {
				-- 	lualine_a = { Harpoon_files },
				-- },
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			local lualine = require("lualine")
			local lazy_status = require("lazy.status") -- to configure lazy pending updates count

			local colors = {
				blue = "#65D1FF",
				green = "#3EFFDC",
				violet = "#FF61EF",
				yellow = "#FFDA7B",
				red = "#FF4A4A",
				fg = "#c3ccdc",
				bg = "#112638",
				inactive_bg = "#2c3043",
			}

			local my_lualine_theme = {
				normal = {
					a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				insert = {
					a = { bg = colors.green, fg = colors.bg, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				visual = {
					a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				command = {
					a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				replace = {
					a = { bg = colors.red, fg = colors.bg, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				inactive = {
					a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
					b = { bg = colors.inactive_bg, fg = colors.semilightgray },
					c = { bg = colors.inactive_bg, fg = colors.semilightgray },
				},
			}

			-- configure lualine with modified theme
			lualine.setup({
				options = {
					theme = my_lualine_theme,
				},
				sections = {
					lualine_x = {
						{
							lazy_status.updates,
							cond = lazy_status.has_updates,
							color = { fg = "#ff9e64" },
						},
						{ "encoding" },
						{ "fileformat" },
						{ "filetype" },
					},
				},
			})
		end,
	},
}
