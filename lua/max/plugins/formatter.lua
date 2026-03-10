return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			bash = { "shfmt" },
			sh = { "shfmt" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			yaml = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			scss = { "prettierd" },
			less = { "prettierd" },
			markdown = { "prettierd" },
			graphql = { "prettierd" },
			vue = { "prettierd" },
			svelte = { "prettierd" },
		},
		-- Skip prettierd if no prettier config exists; oxfmt LSP handles the rest
		formatters = {
			prettierd = {
				require_cwd = true,
			},
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			async = false,
			timeout_ms = 500,
		},
	},
}
