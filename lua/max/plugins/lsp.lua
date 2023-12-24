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
			vim.fn.sign_define("DiagnosticSignInfo", { text = "»", texthl = "DiagnosticSignInfo", numhl = "" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "⚑", texthl = "DiagnosticSignHint", numhl = "" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = "▲", texthl = "DiagnosticSignWarn", numhl = "" })
			vim.fn.sign_define("DiagnosticSignError", { text = "✘", texthl = "DiagnosticSignError", numhl = "" })

			-- Diagnostics
			vim.diagnostic.config({
				virtual_text = false,
				update_in_insert = true,
				-- signs = { active = signs },
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					-- header = "",
					-- prefix = "",
				},
			})

			-- Rounded borders
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

			-- Common on_attach callback for any lsp
			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
				-- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "x" }, "<F3>", function()
					vim.lsp.buf.format({ async = true })
				end, opts)

				-- experimental
				local function tab_definition()
					local current_win = vim.api.nvim_get_current_win()
					local current_buf = vim.api.nvim_win_get_buf(current_win)
					local current_pos = vim.api.nvim_win_get_cursor(current_win)
					vim.lsp.buf.definition()
					vim.schedule(function()
						local new_win = vim.api.nvim_get_current_win()
						local new_buf = vim.api.nvim_win_get_buf(new_win)
						if new_buf ~= current_buf then
							vim.api.nvim_set_current_win(current_win)
							vim.cmd("tabedit")
							vim.api.nvim_set_current_win(new_win)
						end
						vim.api.nvim_win_set_cursor(current_win, current_pos)
					end)
				end

				local function old_tab_definition()
					local org_path = vim.api.nvim_buf_get_name(0)

					-- Go to definition:
					vim.api.nvim_command("normal gd")

					-- Wait LSP server response
					vim.wait(100, function() end)

					local new_path = vim.api.nvim_buf_get_name(0)
					if not (org_path == new_path) then
						-- Create a new tab for the original file
						vim.api.nvim_command("0tabnew %")

						-- Restore the cursor position
						vim.api.nvim_command("b " .. org_path)
						vim.api.nvim_command('normal! `"')

						-- Switch to the original tab
						vim.api.nvim_command("normal! gt")
					end
				end

				vim.keymap.set("n", "gt", old_tab_definition, opts)

				-- Highlight on CursorHold (better than vim-illuminate)
				if client.supports_method("textDocument/documentHighlight") then
					local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
					-- vim.opt.updatetime = 300

					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						group = group,
						buffer = bufnr,
						desc = "highlight references when cursor holds",
						callback = function()
							vim.lsp.buf.document_highlight()
						end,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						group = group,
						buffer = bufnr,
						desc = "clear references when cursor moves",
						callback = function()
							vim.lsp.buf.clear_references()
						end,
					})
				end
			end

			-- on_attach for all LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP common attach",
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					local bufnr = event.buf
					on_attach(client, bufnr)
				end,
			})

			-- Auto format

			-- LSP configurations
			local lspconfig = require("lspconfig")
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					if server_name == "tsserver" then
						return
					end
					lspconfig[server_name].setup({ capabilities = lsp_capabilities })
				end,

				-- Next, you can provide a dedicated handler for specific servers.
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = lsp_capabilities,
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
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
						},
					})
				end,
			})
		end,
	},

	-- Faster typescript server
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		opts = {},
	},
}
