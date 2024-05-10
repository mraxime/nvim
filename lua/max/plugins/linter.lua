return {
	"mfussenegger/nvim-lint",
	ft = { "bash", "docker" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			bash = { "shellcheck" },
			docker = { "hadolint" },
		}
	end,
}
