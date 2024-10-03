return {
	-- LSP setup
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			-- Mason LSP
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			-- LSP signs
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError", numhl = "" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "󰠠 ", texthl = "DiagnosticSignHint", numhl = "" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo", numhl = "" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = "▲ ", texthl = "DiagnosticSignWarn", numhl = "" })

			-- Diagnostics
			vim.diagnostic.config({
				virtual_text = false,
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = true,
				},
			})

			-- Rounded borders
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP common attach",
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)

					-- LSP keymap
					local opts = { buffer = event.buf, silent = true, remap = false }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
					-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
					vim.keymap.set({ "n", "i" }, "<c-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

					-- LSP highlight when CursorHold
					if client and client.supports_method("textDocument/documentHighlight") then
						local group = vim.api.nvim_create_augroup("lsp_document_highlightt", { clear = false })

						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							group = group,
							buffer = event.buf,
							desc = "highlight references when cursor holds",
							callback = function()
								vim.lsp.buf.document_highlight()
							end,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							group = group,
							buffer = event.buf,
							desc = "clear references when cursor moves",
							callback = function()
								vim.lsp.buf.clear_references()
							end,
						})
					end
				end,
			})

			-- LSP capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion = require("cmp_nvim_lsp").default_capabilities().textDocument.completion

			-- LSP config
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup_handlers({
				-- Default handler for installed servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- ["tsserver"] = function()
				-- 	-- faster server handled by typescript-tools.nvim
				-- end,

				["svelte"] = function()
					lspconfig["svelte"].setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							-- Fix .js/.ts files changes not affecting svelte lsp
							-- https://github.com/sveltejs/language-tools/issues/2008
							vim.api.nvim_create_autocmd("BufWritePost", {
								pattern = { "*.js", "*.ts" },
								group = vim.api.nvim_create_augroup("svelte_onDidChangeTsOrJsFile", { clear = true }),
								callback = function(ctx)
									client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
								end,
							})
						end,
					})
				end,

				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
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
									-- Make the language server recognize the `vim` global
									globals = { "vim" },
								},
								workspace = {
									checkThirdParty = false,
									-- Make the server aware of Neovim runtime files
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,

				-- ["tailwindcss"] = function() -- temporary as my machine tailwindcss-language use the insiders version which support v4
				-- 	lspconfig.tailwindcss.setup({
				-- 		cmd = { "/run/user/1000/fnm_multishells/149402_1710017741789/bin/tailwindcss-language-server", "--stdio" },
				-- 		capabilities = lsp_capabilities,
				-- 	})
				-- end,
			})
		end,
	},

	-- Faster typescript server
	-- {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"neovim/nvim-lspconfig",
	-- 	},
	-- 	ft = {
	-- 		"typescript",
	-- 		"typescriptreact",
	-- 		"javascript",
	-- 		"javascriptreact",
	-- 	},
	-- 	config = function()
	-- 		require("typescript-tools").setup({})
	-- 	end,
	-- },
}
