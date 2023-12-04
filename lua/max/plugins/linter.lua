return {
	"mfussenegger/nvim-lint",
	-- event = { "BufReadPre", "BufNewFile" },
	ft = { "bash", "docker" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			bash = { "shellcheck" },
			css = { "stylelint" },
			sass = { "stylelint" },
			scss = { "stylelint" },
			docker = { "hadolint" },
		}
	end,
}
