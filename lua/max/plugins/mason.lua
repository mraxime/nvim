return {
	"williamboman/mason.nvim",
	enabled = true,
	build = ":MasonUpdate",
	cmd = {
		"Mason",
		"MasonUpdate",
	},
	opts = {
		ensure_installed = {
			"css-lsp",
			"docker-compose-language-service",
			"dockerfile-language-server",
			"eslint-lsp",
			"gopls",
			"hadolint",
			"html-lsp",
			"json-lsp",
			"lua-language-server",
			"marksman",
			"prettierd",
			"prisma-language-server",
			-- "biome",
			"selene",
			"shellcheck",
			"taplo",
			"shfmt",
			-- "stylelint",
			"stylua",
			"svelte-language-server",
			"tailwindcss-language-server",
			"templ",
			-- "typescript-language-server",
			"vtsls", -- better typscript lsp?
			"vim-language-server",
			"yaml-language-server",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)

		-- Mason ensure_installed not yet implemented.
		-- https://github.com/williamboman/mason.nvim/issues/103
		local mr = require("mason-registry")
		for _, tool in ipairs(opts.ensure_installed) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
	end,
}
