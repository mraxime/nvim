-- Fancier statusline
return {
	"tamighi/lualine.nvim", -- fork with harpoon_files plugin
	-- "nvim-lualine/lualine.nvim",
	enabled = false,
	branch = "feat/harpoon_files",
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "onedark",
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_x = {
					{
						color = { fg = "#ff9e64" },
					},
				},
				lualine_a = {
					{
						"harpoon_files",
					},
				},
			},
		})
	end,
}
