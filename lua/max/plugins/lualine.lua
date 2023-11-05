-- Fancier statusline
return {
	-- "tamighi/lualine.nvim", -- fork with harpoon_files plugin
	"nvim-lualine/lualine.nvim",
	enabled = true,
	event = "VeryLazy",
	config = function()
		local hp_marks = require("harpoon.mark")
		local devicons = require("nvim-web-devicons")

		function Harpoon_files()
			local contents = {}

			for idx = 1, hp_marks.get_length() do
				local file_path = hp_marks.get_marked_file_name(idx)
				local file_name
				if file_path == "" then
					file_name = "(empty)"
				else
					file_name = vim.fn.fnamemodify(file_path, ":t")
				end
				local dev, _ = devicons.get_icon(file_name)

				local current_file_path = vim.fn.expand("%:f")

				local prev = ""
				if idx ~= 1 then
					prev = " "
				end
				local next = ""
				if idx < hp_marks.get_length() then
					next = " "
				end
				if file_path == current_file_path then
					contents[idx] = string.format("%%#lualine_b_normal#%s%s %s%s", prev, dev, file_name, next)
				else
					contents[idx] = string.format("%%#lualine_b_inactive#%s%s %s%s", prev, dev, file_name, next)
				end
			end

			return table.concat(contents)
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {},
			inactive_sections = {},
			tabline = { lualine_a = { { Harpoon_files } } },
		})
	end,
}
