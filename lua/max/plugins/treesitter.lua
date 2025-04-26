return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	version = false, -- last release is too old
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	cmd = {
		"TSBufDisable",
		"TSBufEnable",
		"TSBufToggle",
		"TSDisable",
		"TSEnable",
		"TSToggle",
		"TSInstall",
		"TSInstallInfo",
		"TSInstallSync",
		"TSModuleInfo",
		"TSUninstall",
		"TSUpdate",
		"TSUpdateSync",
	},
	opts = {
		auto_install = true,
		highlight = {
			enable = true,
			disable = function(_, bufnr)
				return vim.api.nvim_buf_line_count(bufnr) > 10000
			end,
		},
		indent = { enable = true },
		textobjects = {
			select = {
				enable = true,
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
				},
			},
		},
		ensure_installed = {
			"bash",
			"c",
			"css",
			"go",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"prisma",
			"rust",
			"scss",
			"sql",
			"svelte",
			"templ",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
