local parsers = {
	"bash",
	"c",
	"css",
	"go",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
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
}

local install_dir = vim.fn.stdpath("data") .. "/site"

local filetypes = {
	"bash",
	"c",
	"css",
	"go",
	"help",
	"html",
	"javascript",
	"javascriptreact",
	"json",
	"jsonc",
	"lua",
	"markdown",
	"prisma",
	"rust",
	"scss",
	"sh",
	"sql",
	"svelte",
	"templ",
	"typescript",
	"typescriptreact",
	"vim",
	"vimdoc",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	branch = "main",
	version = false, -- last release is too old
	lazy = false,
	build = function()
		if vim.fn.executable("tree-sitter") == 0 then
			error("tree-sitter-cli 0.26.1+ is required; run :MasonInstall tree-sitter-cli")
		end

		local treesitter = require("nvim-treesitter")

		treesitter.setup({ install_dir = install_dir })
		treesitter.install(parsers):wait(300000)
		treesitter.update(parsers):wait(300000)
	end,
	opts = {
		install_dir = install_dir,
	},
	config = function(_, opts)
		local treesitter = require("nvim-treesitter")

		treesitter.setup(opts)

		vim.api.nvim_create_autocmd("FileType", {
			desc = "Enable Tree-sitter highlighting and indentation",
			group = vim.api.nvim_create_augroup("max_treesitter", { clear = true }),
			pattern = filetypes,
			callback = function(event)
				if vim.api.nvim_buf_line_count(event.buf) > 10000 then
					return
				end

				if pcall(vim.treesitter.start, event.buf) then
					vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
