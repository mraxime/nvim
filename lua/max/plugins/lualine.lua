-- Fancier statusline
return {
	"tamighi/lualine.nvim", -- fork with harpoon_files plugin
	-- "nvim-lualine/lualine.nvim",
	enabled = true,
	branch = "feat/harpoon_files",
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {},
			inactive_sections = {},
			tabline = {
				lualine_a = {
					{
						"harpoon_files",
					},
				},
			},
		})
	end,
}
