return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },

		-- load mason before
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- load cmp before

		-- Formatter/Linter
		{
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				local null_ls = require("null-ls")
				null_ls.setup({
					sources = {
						null_ls.builtins.formatting.prettierd,
						null_ls.builtins.formatting.stylua,
						null_ls.builtins.formatting.shfmt,
						null_ls.builtins.diagnostics.hadolint,
						-- null_ls.builtins.diagnostics.selene,
						null_ls.builtins.diagnostics.shellcheck,
						null_ls.builtins.diagnostics.stylelint,
					},
				})
			end,
		},
	},
	config = function()
		-- LSP signs
		vim.fn.sign_define("DiagnosticSignInfo", { text = "»", texthl = "DiagnosticSignInfo", numhl = "" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "⚑", texthl = "DiagnosticSignHint", numhl = "" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "▲", texthl = "DiagnosticSignWarn", numhl = "" })
		vim.fn.sign_define("DiagnosticSignError", { text = "✘", texthl = "DiagnosticSignError", numhl = "" })

		-- config
		vim.diagnostic.config({
			virtual_text = false,
		})

		-- Callback for any lsp
		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "x" }, "<F3>", function()
				vim.lsp.buf.format({ async = true })
			end, opts)

			-- better than vim-illuminate
			if client.supports_method("textDocument/documentHighlight") then
				vim.opt.updatetime = 300
				local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })

				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					group = group,
					buffer = bufnr,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					group = group,
					buffer = bufnr,
					callback = vim.lsp.buf.clear_references,
				})
			end
		end

		-- LSP keymaps when attach
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP keybinds",
			callback = function(event)
				local bufnr = event.buf
				local client = vim.lsp.get_client_by_id(event.data.client_id)

				on_attach(client, bufnr)
			end,
		})

		-- Remove this
		local lsp = require("lsp-zero")
		lsp.format_on_save({
			format_opts = {
				async = false,
				timeout_ms = 10000,
			},
			servers = {
				["rust_analyzer"] = { "rust" },
				["svelte"] = { "svelte" },
				-- if you have a working setup with null-ls
				-- you can specify filetypes it can format.
				["null-ls"] = { "javascript", "typescript", "lua" },
			},
		})
		--lsp.preset({})
		--lsp.setup()

		-- Configure LSP
		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("mason-lspconfig").setup_handlers({
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- default handler (optional)
				lspconfig[server_name].setup({ capabilities = lsp_capabilities })
			end,
			-- Next, you can provide a dedicated handler for specific servers.
			["rust_analyzer"] = function()
				require("rust-tools").setup({})
			end,
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					settings = {
						Lua = {
							-- Disable telemetry
							telemetry = { enable = false },
							runtime = {
								-- Tell the language server which version of Lua you're using
								-- (most likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
								path = vim.split(package.path, ";"),
							},
							diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = { "vim" },
							},
							workspace = {
								checkThirdParty = false,
								library = {
									-- Make the server aware of Neovim runtime files
									vim.fn.expand("$VIMRUNTIME/lua"),
									vim.fn.stdpath("config") .. "/lua",
								},
							},
						},
					},
				})
			end,
		})
	end,
}
