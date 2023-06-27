local M = {}

M.format_on_save = function(opts)
	local format_group = "lsp_zero_format"
	local timeout_ms = 10000

	local autocmd = vim.api.nvim_create_autocmd
	local augroup = vim.api.nvim_create_augroup
	local format_id = augroup(format_group, { clear = true })
	local setup_id = augroup("lsp_zero_format_setup", { clear = true })

	opts = opts or {}
	local servers = opts.servers or {}
	local format_opts = opts.format_opts or {}

	local filetype_setup = function(event)
		-- I don't know how this would happen but apparently it can happen
		local client_id = vim.tbl_get(event, "data", "client_id")
		if client_id == nil then
			return
		end

		local bufnr = event.buf
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		local files = servers[client.name] or {}

		if type(files) == "string" then
			files = { servers[client.name] }
		end

		if files == nil or vim.tbl_contains(files, vim.bo.filetype) == false then
			return
		end

		vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })

		local config = vim.tbl_deep_extend("force", { timeout_ms = timeout_ms }, format_opts, {
			async = false,
			id = client.id,
			bufnr = bufnr,
		})

		local apply_format = function()
			local autoformat = vim.b.lsp_zero_enable_autoformat
			local enabled = (autoformat == nil or autoformat == 1 or autoformat == true)
			if not enabled then
				return
			end

			vim.lsp.buf.format(config)
		end

		local desc = string.format("Format buffer with %s", client.name)

		autocmd("BufWritePre", {
			group = format_id,
			buffer = bufnr,
			desc = desc,
			callback = apply_format,
		})
	end

	autocmd("LspAttach", {
		group = setup_id,
		desc = "Enable format on save",
		callback = filetype_setup,
	})
end

return M
