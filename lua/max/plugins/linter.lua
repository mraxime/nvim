return {
	"mfussenegger/nvim-lint",
	ft = { "bash", "dockerfile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			bash = { "shellcheck" },
			dockerfile = { "hadolint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
			group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
