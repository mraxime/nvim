vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP common attach",
	callback = function(event)
		local function opts(desc)
			return { buffer = event.buf, silent = true, remap = false, desc = "LSP " .. desc }
		end

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Go to references"))
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts("Go to implementation"))
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts("Rename"))
		vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts("Code action"))
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
		vim.keymap.set("n", "<leader>I", function()
			---@diagnostic disable-next-line: missing-fields, assign-type-mismatch
			vim.lsp.buf.code_action({ context = { only = { "source.addMissingImports.ts" } } })
		end, opts("Add missing imports (TypeScript)"))
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP document highlights",
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method("textDocument/documentHighlight") then
			local group = vim.api.nvim_create_augroup("lsp-highlight-" .. event.buf, { clear = true })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = group,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = group,
				callback = vim.lsp.buf.clear_references,
			})
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-highlight-detach-" .. event.buf, { clear = true }),
				callback = function(e)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = group, buffer = e.buf })
				end,
			})
		end
	end,
})

-- Prevent LSP semantic tokens from overwriting treesitter highlights
vim.hl.priorities.semantic_tokens = 95

-- LSP capabilities (blink.cmp is lazy-loaded, so we must inject before servers start)
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

-- Setup json SchemaStores
vim.lsp.config("jsonls", {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

-- Setup yaml SchemaStores
vim.lsp.config("yamlls", {
	settings = {
		yaml = {
			schemaStore = {
				-- You must disable built-in schemaStore support if you want to use
				-- this plugin and its advanced options like `ignore`.
				enable = false,
				-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})

vim.lsp.enable("cssls")
vim.lsp.enable("dockerls")
vim.lsp.enable("docker_compose_language_service")
vim.lsp.enable("eslint")
vim.lsp.enable("gopls")
vim.lsp.enable("html")
vim.lsp.enable("jsonls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("svelte")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("vtsls")
vim.lsp.enable("yamlls")
vim.lsp.enable("prismals")
vim.lsp.enable("cssmodules_ls")
vim.lsp.enable("omnisharp")
vim.lsp.enable("graphql")
