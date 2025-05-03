vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP common attach",
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		local function opts(desc)
			return { buffer = event.buf, silent = true, remap = false, desc = "LSP " .. desc }
		end

		-- LSP keymaps
		-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Show hover informations"))
		-- vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts("Show hover informations"))
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts("Go to implementation"))
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts("Go to type definition"))
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Show references"))
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts("Rename all references"))
		vim.keymap.set({ "n", "i" }, "<c-s>", vim.lsp.buf.signature_help, opts("Show signature help"))
		vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts("Code action"))
		vim.keymap.set("n", "<leader>I", function()
			---@diagnostic disable-next-line: missing-fields, assign-type-mismatch
			vim.lsp.buf.code_action({ context = { only = { "source.addMissingImports.ts" } } })
		end, opts("Add missing imports (TypeScript)"))

		-- LSP highlight when CursorHold
		if client and client.server_capabilities.documentHighlightProvider then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	callback = function(event)
		vim.lsp.buf.clear_references()
		vim.api.nvim_clear_autocmds({ group = "lsp_document_highlight", buffer = event.buf })
	end,
})

-- Prevent LSP Semantic tokens from overwriting treesitter color settings
-- https://github.com/NvChad/NvChad/issues/1907
vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- LSP capabilities
vim.lsp.config("*", {
	-- vim.lsp.protocol.make_client_capabilities()
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
