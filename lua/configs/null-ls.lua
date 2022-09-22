local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = "[eslint] #{m}\n(#{c})",
    }),
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
  },
  -- on_attach = function(client)
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     desc = "Auto format before save",
  --     pattern = "<buffer>",
  --     callback = function()
  --       vim.lsp.buf.format()
  --     end,
  --   })
  -- end,
})
