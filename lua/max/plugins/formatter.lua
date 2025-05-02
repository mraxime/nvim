return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			bash = { "shfmt" },
			sh = { "shfmt" },
			html = { "prettierd" },
			css = { "prettierd" },
			scss = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			graphql = { "prettierd" },
			toml = { "taplo" },
			svelte = { "prettierd" },
			-- lsp format fallback on other files
			["_"] = { lsp_format = "fallback" },
		},
		format_on_save = {
			async = false,
			timeout_ms = 500,
		},
	},
}
