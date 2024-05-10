return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	version = false, -- last release is too old
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
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
		highlight = {
			enable = true,
			disable = function(_, bufnr)
				return vim.api.nvim_buf_line_count(bufnr) > 10000
			end,
		},
		incremental_selection = { enable = true },
		indent = { enable = true },
		autotag = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"css",
			"html",
			"javascript",
			"json",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"query",
			"regex",
			"rust",
			"scss",
			"sql",
			"svelte",
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
